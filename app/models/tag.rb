class Tag < ApplicationRecord
  has_many :destinations
  has_one_attached :image_header
  has_many_attached :image_uploads
  
  validates :title, :description, presence: true
  validate :image_type
  
  before_save :capitalize_fields
  
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
