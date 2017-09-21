class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name_j
      t.string :name_e

      t.timestamps null: false
    end
  end
end
