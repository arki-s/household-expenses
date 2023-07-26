class AddUseridToRecords < ActiveRecord::Migration[7.0]
  def change
    add_reference :records, :user, type: :integer, null: false, foreign_key: true
  end
end
