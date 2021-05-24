class AddToLikecommentsTalkColumnToNotification < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications,:talk_id,:integer
    add_column :notifications,:likecomment_id,:integer
  end
end
