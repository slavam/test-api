class Car < ApplicationRecord
  belongs_to :user
  belongs_to :make_model
end
