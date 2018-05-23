class CreateDealerbranches < ActiveRecord::Migration
  def change
    create_table :dealerbranches do |t|
      t.references :dealercompany, index: true, foreign_key: true
      t.string :name


      t.timestamps null: false
    end
  end
end
