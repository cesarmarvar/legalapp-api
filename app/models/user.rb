class User < ApplicationRecord
  # Validations
  validates :email, presence: true, 
            uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true,
            # format: { with: /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E]){8,}$/ }

  # Associations
  has_secure_token
  has_secure_password
  has_many :questions
  has_many :reviews

  def invalidate_token
    update(token: nil)
  end
end
