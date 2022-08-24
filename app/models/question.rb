class Question < ApplicationRecord
  # Validations
  validates :question, presence: true
  validates :explanation, presence: true
  validates :explanation, length: { maximum: 550, too_long: "characters exceed the maximum allowed" }
  validates :confirmation, inclusion: { in: %w(yes no maybe)}

  # Associations
  belongs_to :user, optional: true
end
