class Destination < ApplicationRecord
  belongs_to :tags
  has_many_attached :image_uploads
end
