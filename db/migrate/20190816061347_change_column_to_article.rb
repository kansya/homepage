class ChangeColumnToArticle < ActiveRecord::Migration[5.1]
  def change
    change_column :articles, :title, :string, null: false
    change_column :articles, :article, :text, null: false
    change_column :articles, :category, :string, null: false
    change_column :articles, :state, :integer, null: false

    change_column :comments, :text, :text, null: false    
    change_column :comments, :nickname, :string, null: false
  end
end
