class Tag < ApplicationRecord
  has_many :destinations
  has_one_attached :image_header
  has_many_attached :image_uploads
end
