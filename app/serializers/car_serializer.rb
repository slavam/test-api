class CarSerializer < ActiveModel::Serializer
  attributes :id, :make, :model, :manufacture_year, :color, :plate, :lat, :lng
  # has_one :user
  # has_one :make_model
end
