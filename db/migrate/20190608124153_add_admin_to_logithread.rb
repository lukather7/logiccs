class AddAdminToLogithread < ActiveRecord::Migration
  def change
    add_reference :logithreads, :admin, foreign_key: true
  end
end
