class AddPasswordToDealeruser < ActiveRecord::Migration
  def change
    add_column :dealerusers, :password_digest, :string
  end
end
