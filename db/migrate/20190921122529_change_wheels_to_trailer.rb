class ChangeWheelsToTrailer < ActiveRecord::Migration
  def change
     change_column :trailers, :wheels, :string
  end
end
