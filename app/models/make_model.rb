class MakeModel < ApplicationRecord
  belongs_to :car_make
  has_many :cars
end
