class RemoveAuthorFromArticles < ActiveRecord::Migration[5.1]
  def change
    remove_column :articles, :author, :integer
  end
end
