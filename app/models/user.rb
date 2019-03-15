class User < ApplicationRecord

  validates :phone, presence: true, length: { is: 10 }, uniqueness: true, numericality: { only_integer: true }
  validates_uniqueness_of :nickname, allow_blank: true
  validates :nickname, length: {minimum: 5}, on: :update
  has_many :posts, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :comments, dependent: :nullify
  
  devise :database_authenticatable, :registerable,:trackable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:phone]

  has_and_belongs_to_many :follows, dependent: :destroy,
                                    join_table: :followers,
                                    class_name: 'User',
                                    foreign_key: :follower_id,
                                    association_foreign_key: :follow_id

  has_and_belongs_to_many :followers, dependent: :destroy,
                                      join_table: :followers,
                                      class_name: 'User',
                                      foreign_key: :follow_id,
                                      association_foreign_key: :follower_id

  has_and_belongs_to_many :inviteds, dependent: :destroy,
                                    join_table: :invites,
                                    class_name: 'User',
                                    foreign_key: :invited_id,
                                    association_foreign_key: :inviter_id
  
    has_and_belongs_to_many :inviters, dependent: :destroy,
                                      join_table: :invites,
                                      class_name: 'User',
                                      foreign_key: :inviter_id,
                                      association_foreign_key: :invited_id

  has_and_belongs_to_many :liked_posts, dependent: :nullify,
                                        join_table: :likes,
                                        class_name: 'Post'

  def email_required?
    false
  end

  def email_changed?
    false
  end

  include PgSearch
  pg_search_scope :search, 
    against: [:nickname, :phone],
    using: {tsearch: {dictionary: "english"}},
    associated_against: { users: [:nickname, :phone]},
    ignoring: :accents

  def self.text_search(query)
    if query.present?
      where("nickname ilike :q", q: "%#{query}%")
    else
      where(nil)
    end
  end

  def online?
    updated_at > 30.minutes.ago
  end
  private
  symbols = [ '!', '@', '#', '$', '%', '^', '&', '*', '(', ')', ':', ';', '<', '>', '-', '_']
  def error_messages
    if nickname.length < 5
      puts "your nickname has to be more symbols"
    end
  end
end