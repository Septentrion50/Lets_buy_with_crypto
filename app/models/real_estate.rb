class RealEstate < ApplicationRecord
  belongs_to :user
  has_many :housecoins
end