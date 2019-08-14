class ChangeDatatypeAuthorOfArticles < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :author, :integer
  end
end
