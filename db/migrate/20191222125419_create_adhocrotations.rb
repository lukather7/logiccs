class CreateAdhocrotations < ActiveRecord::Migration
  def change
    create_table :adhocrotations do |t|
      t.references :truck
      t.references :trailer
      t.date :date
      t.integer :mileage
      t.string :tire1sn
      t.string :tire2sn
      t.string :tire3sn
      t.string :tire4sn
      t.string :tire5sn
      t.string :tire6sn
      t.string :tire7sn
      t.string :tire8sn
      t.string :tire9sn
      t.string :tire10sn
      t.string :tire11sn
      t.string :tire12sn
      t.string :tire13sn

      t.integer :tire1depth
      t.integer :tire2depth
      t.integer :tire3depth
      t.integer :tire4depth
      t.integer :tire5depth
      t.integer :tire6depth
      t.integer :tire7depth
      t.integer :tire8depth
      t.integer :tire9depth
      t.integer :tire10depth
      t.integer :tire11depth
      t.integer :tire12depth
      t.integer :tire13depth

      t.date :tire1purchase
      t.date :tire2purchase
      t.date :tire3purchase
      t.date :tire4purchase
      t.date :tire5purchase
      t.date :tire6purchase
      t.date :tire7purchase
      t.date :tire8purchase
      t.date :tire9purchase
      t.date :tire10purchase
      t.date :tire11purchase
      t.date :tire12purchase
      t.date :tire13purchase
      
      t.timestamps null: false
    end
  end
end
