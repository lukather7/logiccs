class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :company, index: true, foreign_key: true
      t.string :name
      t.boolean :authorizer
      t.references :branch, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
