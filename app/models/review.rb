class Review < ApplicationRecord
  belongs_to :lawyer
  belongs_to :user
end
