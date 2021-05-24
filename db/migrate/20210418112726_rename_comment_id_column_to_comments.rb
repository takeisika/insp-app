class RenameCommentIdColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comment_id, :post_id
  end
end
