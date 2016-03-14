class LocationSerializer < ActiveModel::Serializer
  attributes :id, :full_address, :country, :city, :address1, :lat, :lng
end
