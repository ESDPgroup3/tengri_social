class Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { in: 20..500 }
end
