class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { in: 20..500 }
  validate :correct_image_type

  belongs_to :user
  has_many_attached :images
  
  private 

  def correct_image_type

  	if images.attached? && !images.all? {|image| image.content_type.in?( %w( image/jpeg image/png )) }
      errors.add(:images , 'Must be a JPEG or a PNG')
  	elsif images.attached? == false 
  		errors.add(:images , 'required')
  	end

  end
end
