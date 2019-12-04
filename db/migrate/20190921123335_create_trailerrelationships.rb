class CreateTrailerrelationships < ActiveRecord::Migration
  def change
    create_table :trailerrelationships do |t|
      t.references :user, index: true, foreign_key: true
      t.references :trailer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
