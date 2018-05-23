class CreateDealercompanies < ActiveRecord::Migration
  def change
    create_table :dealercompanies do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
