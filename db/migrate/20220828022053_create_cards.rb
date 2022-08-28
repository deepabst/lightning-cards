class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.text :front_text
      t.text :back_text
      t.text :front_img
      t.text :back_img
      t.string :category

      t.timestamps
    end
  end
end
