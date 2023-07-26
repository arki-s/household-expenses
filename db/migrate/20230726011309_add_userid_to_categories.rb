class AddUseridToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :user, type: :integer, null: false, foreign_key: true
  end
end
