class AddToReadToNotificationColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications,:read,:string
  end
end
