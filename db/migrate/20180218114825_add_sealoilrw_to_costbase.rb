class AddSealoilrwToCostbase < ActiveRecord::Migration
  def change
    add_column :costbases, :seal_oil_rear_wheel, :integer
  end
end
