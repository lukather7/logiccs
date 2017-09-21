class AddImageFromTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :image, :string
  end
end
