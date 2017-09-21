class CreateCostbases < ActiveRecord::Migration
  def change
    create_table :costbases do |t|
      t.references :company, index: true, foreign_key: true
      t.string :model
      t.string :category
      t.integer :oil_filter
      t.integer :fuel_filter
      t.integer :ps_oil
      t.integer :tm_oil
      t.integer :df_oil
      t.integer :air_filter
      t.integer :air_drier
      # G.Wheel_oil ??
      t.integer :break_oil
      t.integer :clutch_oil
      t.integer :coolant
      t.integer :grease
      t.integer :cng_filter
      t.integer :spark_plug
      t.integer :clutch_kit
      t.integer :battery
      t.integer :filter_ps_oil
      t.integer :timing_belt_eg
      t.integer :timing_belt_ac
      t.integer :filter_axle
      t.integer :softwasher     # soft ?? sword ??
      t.integer :gasket_front_wheel
      t.integer :gasket_rear_wheel
      t.integer :seal_oil_front_wheel
      t.integer :wheel_grease

      t.timestamps null: false
    end
  end
end
