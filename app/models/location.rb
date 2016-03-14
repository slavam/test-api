class Location < ApplicationRecord
  # attr_accessible :full_address, :lat, :lng
  has_one       :from_go, 
                :class_name => "Order",
                :foreign_key  => "from_id"

  has_one       :to_go, 
                :class_name => "Order", 
                :foreign_key  => "to_id"
                
  acts_as_mappable :default_units => :kms, 
               :default_formula => :sphere, 
               :distance_field_name => :distance,
               :lat_column_name => :lat,
               :lng_column_name => :lng
end
