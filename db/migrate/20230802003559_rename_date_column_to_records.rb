class RenameDateColumnToRecords < ActiveRecord::Migration[7.0]
  def change
    rename_column :records, :date, :start_time
  end
end
