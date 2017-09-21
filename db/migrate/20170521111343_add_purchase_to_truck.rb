class AddPurchaseToTruck < ActiveRecord::Migration
  def change
    add_column :trucks, :purchase, :date
  end
end
