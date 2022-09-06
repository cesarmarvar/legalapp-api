class Photo < ApplicationRecord
  # Validations
  validates :image, presence: true
  # validates :photoable_type, presence: true
  # validates :photoable_id, presence: true

  # Associations
  belongs_to :photoable, polymorphic: true
end
