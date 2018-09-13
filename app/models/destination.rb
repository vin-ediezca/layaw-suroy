class Destination < ApplicationRecord
  belongs_to :tags, required: false
  has_one_attached :blog_image
  
  validates :blog_title, :blog_body, presence: true
  validate :image_type

  def to_param
    "#{id}-#{blog_title}"
  end

  private
    def image_type
      if blog_image.attached? == true
        if !blog_image.content_type.in?(%('image/jpeg image/png'))
          errors.add(:blog_image, "must be JPEG or PNG")
        end
      end
    end
end
