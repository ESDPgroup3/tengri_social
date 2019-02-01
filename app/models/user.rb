class User < ApplicationRecord

  validates :phone, presence: true, length: { is: 10 }, uniqueness: true, numericality: { only_integer: true }

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

  has_and_belongs_to_many :liked_posts, dependent: :nullify,
                                        join_table: :likes,
                                        class_name: 'Post'

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def online?
    updated_at > 30.minutes.ago
  end
end
