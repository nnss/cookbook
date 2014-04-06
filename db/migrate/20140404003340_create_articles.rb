class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.references :user
      t.string :lang
      t.text :text

      t.timestamps
    end
    add_index :articles, :user_id
  end
end
