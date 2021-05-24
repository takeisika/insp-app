class AddToReadColumnToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks,:read,:string
  end
end
