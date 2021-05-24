class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :post_id
      t.integer :comment_id
      t.string :action

      t.timestamps
    end
  end
end
