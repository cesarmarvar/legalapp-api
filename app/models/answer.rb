class Answer < ApplicationRecord
  validates :answer, presence: true
  validates :answer, length: { maximum: 600, too_long: "%{count} characters is the maximum allowed" }

  belongs_to :question, counter_cache: true
  belongs_to :lawyer
end
