class Tag < ApplicationRecord
  has_and_belongs_to_many :posts
  
  def self.hashtag_search(query)
      if query.present?
        where("name ilike :q", q: "%#{query}%")
      else
        where(nil)
      end
  end
end
