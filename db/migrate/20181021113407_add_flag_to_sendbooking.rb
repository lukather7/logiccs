class AddFlagToSendbooking < ActiveRecord::Migration
  def change
    add_column :sendbookings, :done, :boolean, default: 0
  end
end
