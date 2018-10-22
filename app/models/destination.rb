class Destination < ApplicationRecord
  belongs_to :tag
  has_many_attached :blog_image
  
  extend FriendlyId
  friendly_id :blog_title, use: :slugged
  
  validates :blog_title, :blog_body, :tag_id, presence: true
  validates :blog_title, length: {minimum: 4, maximum: 50}
  validate :image_type
  before_update :image_type

  private
    def image_type
      if blog_image.attached? == true
        blog_image.each do |image|
          if !image.content_type.in?(%('image/jpeg image/png'))
            errors.add(:blog_image, "must be JPEG or PNG")
          end
        end
      end
    end
end
