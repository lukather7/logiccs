class CreateTruckhistories < ActiveRecord::Migration
  def change
    create_table :truckhistories do |t|
      t.references :truck, index: true, foreign_key: true
      t.date :record
      t.integer :mileage

      t.timestamps null: false
    end
  end
end
