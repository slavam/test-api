class Order < ApplicationRecord
  belongs_to :user
  belongs_to :from_location, :class_name => 'Location', foreign_key: 'from_location_id' 
  belongs_to :to_location, :class_name => 'Location', foreign_key: 'to_location_id'
  belongs_to :order_state
  has_and_belongs_to_many :options
end