class AddPurchasedateToTirehistory < ActiveRecord::Migration
  def change
    add_column :tirehistories, :purchasedate, :date
  end
end
