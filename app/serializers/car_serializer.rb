class CarSerializer < ActiveModel::Serializer
  attributes :id, :make, :model, :manufacture_year, :color, :plate
  has_one :user
end
