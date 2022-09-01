class AddFrontConfidenceToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :front_confidence, :integer, default: 0
  end
end
