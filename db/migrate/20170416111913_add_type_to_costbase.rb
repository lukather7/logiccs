class AddTypeToCostbase < ActiveRecord::Migration
  def change
    add_column :costbases, :type, :string
  end
end
