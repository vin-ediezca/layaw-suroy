class Tag < ApplicationRecord
  has_many :destinations
  has_one_attached :image_header
end
