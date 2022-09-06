class Review < ApplicationRecord
  # after_save :set_reviews_average

  # Validations
  enum context: { consulted: 0, hired: 1 }
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..5 }

  validates :title, presence: true
  validates :content, presence: true
  validates :context, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } # deberia condicionarse a si no hay un user loggeado? 

  # Associations
  belongs_to :lawyer, counter_cache: true
  belongs_to :user, optional: :true # No es necesario hacer sign_up para crear un review

  # private
  
  # def set_reviews_average
  #   update_column(:reviews_average, reviews.average(:rating))
  # end
end
