class RenameRecordToTruckhistories < ActiveRecord::Migration
  def up
    rename_column :truckhistories, :record, :action
    #   呪文     :テーブル名, :旧カラム名, :新カラム名
  end

  def down
    rename_column :truckhistories, :action, :record
    #   呪文     :テーブル名, :新カラム名, :旧カラム名
  end
end
