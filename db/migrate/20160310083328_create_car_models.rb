class CreateCarModels < ActiveRecord::Migration[5.0]
  def change
    create_table :car_models do |t|
      t.references :mark, foreign_key: true
      t.string :model

      t.timestamps :null => false, :default => Time.now
    end
  end
end
