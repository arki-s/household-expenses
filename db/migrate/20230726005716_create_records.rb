class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.datetime :date
      t.integer :amounts
      t.text :comment
      t.references :budget, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true


      t.timestamps
    end
  end
end
