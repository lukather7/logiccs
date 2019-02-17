class CreateLogiposts < ActiveRecord::Migration
  def change
    create_table :logiposts do |t|
      t.references :logithread, index: true, foreign_key: true
      t.datetime :date
      t.string :content
      t.references :dealeruser, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
