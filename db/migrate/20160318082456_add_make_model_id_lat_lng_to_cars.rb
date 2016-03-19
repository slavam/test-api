class AddMakeModelIdLatLngToCars < ActiveRecord::Migration[5.0]
  def change
    add_reference :cars, :make_model, index: true, foreign_key: true
    add_column :cars, :lat, :float
    add_column :cars, :lng, :float
  end
end
