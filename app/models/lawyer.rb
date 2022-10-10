class Lawyer < ApplicationRecord
  # Validations
  validates :lawyer_name, presence: true
  validates :years_licensed, presence: true
  validates :years_licensed, numericality: { only_integer: true}
  validates :bio, presence: true
  validates :bio, length: { maximum: 1200, too_long: "%{count} characters is the maximum allowed" }
  validates :payment_method, presence: true
  validates :credentials, presence: true
  validates :social_media, presence: true
  validates :state_location, presence: true
  validates :office_address, presence: true
  validates :office_phone, length: { in: 6..12 }
  validates :cellphone, length: { in: 6..12 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :lat, presence: true
  validates :long, presence: true
  validates :user_id, uniqueness: true

  # Associations
  # has_many_attached :images
  has_many :photos, as: :photoable, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :lawyer_specialities
  has_many :reviews
  belongs_to :user
end
