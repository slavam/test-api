class MakeModelSerializer < ActiveModel::Serializer
  attributes :id, :model
  has_one :car_make
end
