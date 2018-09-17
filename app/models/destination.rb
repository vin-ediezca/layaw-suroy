class Destination < ApplicationRecord
  belongs_to :tag
  has_one_attached :blog_image
  
  extend FriendlyId

  friendly_id :blog_title, use: :slugged
  
  validates :blog_title, :blog_body, presence: true
  validate :image_type
  before_update :image_type

  private
    def image_type
      if blog_image.attached? == true
        if !blog_image.content_type.in?(%('image/jpeg image/png'))
          errors.add(:blog_image, "must be JPEG or PNG")
        end
      end
    end
end
