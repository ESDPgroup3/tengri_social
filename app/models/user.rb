class User < ApplicationRecord

  has_many :posts, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:phone]

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
