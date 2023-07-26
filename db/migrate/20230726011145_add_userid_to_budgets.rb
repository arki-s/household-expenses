class AddUseridToBudgets < ActiveRecord::Migration[7.0]
  def change
    add_reference :budgets, :user, type: :integer, null: false, foreign_key: true
  end
end
