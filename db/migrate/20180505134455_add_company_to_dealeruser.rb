class AddCompanyToDealeruser < ActiveRecord::Migration
  def change
    add_reference :dealerusers, :dealercompany, index: true, foreign_key: true
  end
end
