class CreateTrailers < ActiveRecord::Migration
  def change
    create_table :trailers do |t|
      t.references :company, index: true, foreign_key: true
      t.references :branch, index: true, foreign_key: true
      t.integer :wheels
      t.string :vehicleid
      t.string :number
      t.string :tire
      t.date :purchase
      t.string :image
      t.references :dealercompany, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
