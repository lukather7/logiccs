class AddBranchToDealeruser < ActiveRecord::Migration
  def change
    add_reference :dealerusers, :dealerbranch, index: true, foreign_key: true
  end
end
