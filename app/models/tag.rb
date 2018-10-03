class Tag < ApplicationRecord
  has_many :destinations , dependent: :destroy
  has_one_attached :image_header
  has_many_attached :image_uploads

  extend FriendlyId

  friendly_id :title, use: :slugged
  
  validates :title, :description, :map_embed, presence: true
  validates :title, length: {minimum: 4, maximum: 50}
  validate :image_type
  
  before_save :capitalize_fields

  # will_paginate per page
  self.per_page = 6

  def capitalize_fields
    self.title = title.split.each { |n| 
      n.capitalize!
    }.join(' ')
  end
  
  def self.search(pattern)
    if pattern.blank?  # blank? covers both nil and empty string
      all
    else
      where('title ILIKE ? OR description ILIKE ?', "%#{pattern}%", "%#{pattern}%")
    end
  end
  
  private
    def image_type
      if image_header.attached? == false
        errors.add(:image_header, "is missing")
      elsif !image_header.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image_header, "must be JPEG or PNG")
      end
      
      if image_uploads.attached? == true
        image_uploads.each do |image|
          if !image.content_type.in?(%('image/jpeg image/png'))
            errors.add(:image_uploads, "must be JPEG or PNG")
          end
        end
      end
    end
end
