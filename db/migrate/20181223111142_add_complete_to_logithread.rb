class AddCompleteToLogithread < ActiveRecord::Migration
  def change
    add_column :logithreads, :complete, :date
  end
end
