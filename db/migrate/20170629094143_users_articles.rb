class UsersArticles < ActiveRecord::Migration[5.0]
  def change
    drop_table :users_articles
  end
end
