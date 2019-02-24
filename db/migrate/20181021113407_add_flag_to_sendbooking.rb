class AddFlagToSendbooking < ActiveRecord::Migration
  def change
    add_column :sendbookings, :done, :boolean, default: false
  end
end
