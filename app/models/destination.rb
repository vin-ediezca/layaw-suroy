class Destination < ApplicationRecord
  belongs_to :tags, required: false
  
  validates :blog_title, :blog_body, presence: true
end
