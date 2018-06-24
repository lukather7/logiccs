class CreateApprovers < ActiveRecord::Migration
  def change
    create_table :approvers do |t|
      t.references :company, index: true, foreign_key: true
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
