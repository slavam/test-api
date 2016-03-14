class OrderSerializer < ActiveModel::Serializer
  attributes :id, :cost, :comment, :score
  has_one :user
  has_one :from_location
  has_one :to_location
  has_one :order_state
end
