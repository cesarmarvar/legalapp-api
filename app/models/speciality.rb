class Speciality < ApplicationRecord
  validates :speciality, presence: true

  has_many :lawyer_specialities
end
