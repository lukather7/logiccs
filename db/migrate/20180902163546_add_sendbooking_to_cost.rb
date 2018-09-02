class AddSendbookingToCost < ActiveRecord::Migration
  def change
    add_reference :costbases, :sendbooking, index: true, foreign_key: true
  end
end
