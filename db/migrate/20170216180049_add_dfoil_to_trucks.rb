class AddDfoilToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :df_oil, :integer
    add_column :trucks, :initmileage, :integer
  end
end
