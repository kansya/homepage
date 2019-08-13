class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string      :title
      t.text        :article
      t.string      :category
      t.string      :author
      t.integer     :state
      t.text        :comment
      t.timestamps
    end
  end
end
