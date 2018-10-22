class Category < ApplicationRecord
  has_many :tag_categories
  has_many :tags, through: :tag_categories

  validates :name, presence: true
  validates :name, length: {minimum: 3, maximum: 20}

  before_save :capitalize_fields

  def capitalize_fields
    self.name = name.split.each { |n| 
      n.capitalize!
    }.join(' ')
  end
end
