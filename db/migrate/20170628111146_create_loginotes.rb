class CreateLoginotes < ActiveRecord::Migration
  def change
    create_table :loginotes do |t|
      t.references :truck, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
      t.index [:truck_id, :created_at]
    end
  end
end
