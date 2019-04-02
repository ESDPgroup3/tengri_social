# frozen_string_literal: true

class Post < ApplicationRecord
  validates :description, presence: true, length: { in: 5..500 }
  # validate :correct_image_type

  belongs_to :user

  has_one_attached :picture, dependent: :destroy

  has_one_attached :attachment

  has_and_belongs_to_many :likes, dependent: :nullify,
                                  join_table: :likes,
                                  class_name: 'User'

  has_and_belongs_to_many :tags
  
  after_commit on: :create do
    post = Post.find_by(id: self.id)
    hashtags = self.description.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
      post.tags << tag
    end
  end

  before_update do
    post = Post.find_by(id: self.id)
    post.tags.clear
    hashtags = self.description.scan(/#\w+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete("#"))
      post.tags << tag
    end
  end

  scope :of_followed_users, ->(following_users) { where user_id: following_users }
  
  has_many :comments, as: :commentable, dependent: :destroy

  private

  def correct_image_type
    # if picture.attached? && !picture.all? {|image| image.content_type.in?( %w( image/jpeg image/png )) }
    #    errors.add(:images , 'Must be a JPEG or a PNG')
    # elsif images.attached? == false
    #   errors.add(:images , 'required')
    # end
  end
end
