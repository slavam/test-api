class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :phone
      t.references :user_state, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :picture
      t.string :city
      t.boolean :have_car
      t.string :code_token

      t.timestamps
    end
  end
end
