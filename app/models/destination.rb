class Destination < ApplicationRecord
  belongs_to :tags, required: false
  has_one_attached :blog_image
  
  validates :blog_title, :blog_body, presence: true
end
