class RemoveCommentFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :comment, :text
  end
end
