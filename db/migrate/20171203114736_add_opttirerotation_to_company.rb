class AddOpttirerotationToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :opt_tirerotation, :bool, default: false
  end
end
