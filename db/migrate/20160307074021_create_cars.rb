class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.references :user, foreign_key: true
      t.string :make
      t.string :model
      t.string :manufacture_year
      t.string :color
      t.string :plate

      t.timestamps
    end
  end
end
