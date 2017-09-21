class CreateMaintains < ActiveRecord::Migration
  def change
    create_table :maintains do |t|
      t.references :truck, index: true, foreign_key: true
      t.date :action
      t.integer :mileage
      t.integer :nextmileage
      t.string :content

      t.timestamps null: false
    end
  end
end
