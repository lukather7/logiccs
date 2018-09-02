class AddTotalcostToCostbase < ActiveRecord::Migration
  def change
    add_column :costbases, :totalcost, :integer
    add_column :costbases, :extra1, :string
    add_column :costbases, :extra1parts, :integer
    add_column :costbases, :extra1labor, :integer
    add_column :costbases, :extra2, :string
    add_column :costbases, :extra2parts, :integer
    add_column :costbases, :extra2labor, :integer
    add_column :costbases, :extra3, :string
    add_column :costbases, :extra3parts, :integer
    add_column :costbases, :extra3labor, :integer
    add_column :costbases, :extra4, :string
    add_column :costbases, :extra4parts, :integer
    add_column :costbases, :extra4labor, :integer
    add_column :costbases, :extra5, :string
    add_column :costbases, :extra5parts, :integer
    add_column :costbases, :extra5labor, :integer
    add_column :costbases, :extra6, :string
    add_column :costbases, :extra6parts, :integer
    add_column :costbases, :extra6labor, :integer
    add_column :costbases, :extra7, :string
    add_column :costbases, :extra7parts, :integer
    add_column :costbases, :extra7labor, :integer
    add_column :costbases, :extra8, :string
    add_column :costbases, :extra8parts, :integer
    add_column :costbases, :extra8labor, :integer
    add_column :costbases, :extra9, :string
    add_column :costbases, :extra9parts, :integer
    add_column :costbases, :extra9labor, :integer
    add_column :costbases, :extra10, :string
    add_column :costbases, :extra10parts, :integer
    add_column :costbases, :extra10labor, :integer
  end
end
