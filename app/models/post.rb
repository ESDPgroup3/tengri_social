class Post < ApplicationRecord
  validates :description, presence: true, length: { in: 5..500 }
  # validate :correct_image_type

  belongs_to :user
  has_one_attached :picture

  has_and_belongs_to_many :likes,
  join_table: :likes,
  class_name: 'User'
  scope :of_followed_users, -> (following_users) { where user_id: following_users}

  has_many :comments, as: :commentable
  
  private 

  def correct_image_type

  	# if picture.attached? && !picture.all? {|image| image.content_type.in?( %w( image/jpeg image/png )) }
   #    errors.add(:images , 'Must be a JPEG or a PNG')
  	# elsif images.attached? == false 
  	# 	errors.add(:images , 'required')
  	# end

  end
end
