class Contact < ApplicationRecord

  validates :username, presence: true
  validates :phone_number, presence: true
  validates :phone_number, numericality: { only_integer: true}
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :title, presence: true
  validates :situation, presence: true

  belongs_to :speciality
end
