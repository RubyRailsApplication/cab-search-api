class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.float :longitude
      t.float :latitude
      t.string :name
      t.integer :phone_number
      t.string :car_number

      t.timestamps
    end
  end
end
