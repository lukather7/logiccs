class CreateTirehistories < ActiveRecord::Migration
  def change
    create_table :tirehistories do |t|
      t.references :truck, index: true, foreign_key: true
      t.integer :index
      t.string :serialno

      t.timestamps null: false
    end
  end
end
