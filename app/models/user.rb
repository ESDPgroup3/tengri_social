class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  has_many :comments
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:phone]

  has_and_belongs_to_many :follows,
  join_table: :followers,
  class_name: 'User',
  foreign_key: :follower_id,
  association_foreign_key: :follow_id

  has_and_belongs_to_many :followers,
  join_table: :followers,
  class_name: 'User',
  foreign_key: :follow_id,
  association_foreign_key: :follower_id

  has_and_belongs_to_many :liked_posts,
  join_table: :likes,
  class_name: 'Post'

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
