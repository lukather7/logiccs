class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.references :company, index: true, foreign_key: true
      t.references :branch, index: true, foreign_key: true
      t.string :maker
      t.string :model
      t.string :body
      t.integer :wheels
      t.integer :year
      t.integer :age
      t.string :engine
      t.string :vehicleid
      t.string :number
      t.integer :e_oil
      t.integer :tm_oil
      t.string :tire

      t.timestamps null: false
    end
  end
end
