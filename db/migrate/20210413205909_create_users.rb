class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :image_name
      t.string :password
      t.text :introduction
      t.string :email

      t.timestamps
    end
  end
end
