class Question < ApplicationRecord
  # Validations
  validates :question, presence: true
  validates :explanation, presence: true, 
  validates :explanation, length: { maximum: 550, too_long: "%{count} characters is the maximum allowed" }

  # Associations
  belongs_to :user
  belongs_to :lawyer
end
