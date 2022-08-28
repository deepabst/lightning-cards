class AddDeckIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :deck_id, :integer
  end
end
