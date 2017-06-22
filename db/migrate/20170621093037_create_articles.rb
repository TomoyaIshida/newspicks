class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :sitename, null: false, default: ""
      t.string :url, null: false, default: ""
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :image, null: false, default: ""
      t.timestamps
    end
  end
end
