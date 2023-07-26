class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.datetime :date
      t.integer :amounts
      t.text :comment
      t.references :budgets, null: false, foreign_key: true
      t.references :categories, null: false, foreign_key: true


      t.timestamps
    end
  end
end
