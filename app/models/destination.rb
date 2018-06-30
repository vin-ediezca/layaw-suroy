class Destination < ApplicationRecord
  belongs_to :tags, required: false
end
