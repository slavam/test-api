class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :full_address
      t.string :country
      t.string :city
      t.string :address1
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
