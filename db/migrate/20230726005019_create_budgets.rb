class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :name
      t.integer :amounts
      t.boolean :completed, default: false
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
