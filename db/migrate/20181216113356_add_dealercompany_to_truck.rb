class AddDealercompanyToTruck < ActiveRecord::Migration
  def change
    add_reference :trucks, :dealercompany, index: true, foreign_key: true
  end
end
