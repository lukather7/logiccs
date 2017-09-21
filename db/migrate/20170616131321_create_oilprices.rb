class CreateOilprices < ActiveRecord::Migration
  def change
    create_table :oilprices do |t|
      t.integer :price

      t.timestamps null: false
    end
  end
end
