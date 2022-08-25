class Review < ApplicationRecord
  # Validations
  enum context: { consulted: 0, hired: 1 }
  validates :rating, presence: true,
                     numericality: { only_integer: true },
                     inclusion: { in: 1..5 }

  validates :title, presence: true
  validates :content, presence: true
  validates :context, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }


  # Associations
  belongs_to :lawyer
  belongs_to :user, optional: :true # No es necesario hacer sign_up para crear un review
end
