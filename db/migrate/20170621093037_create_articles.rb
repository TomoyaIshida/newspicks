class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :sitename, null: false, default: ""
      t.string :url, index: true, null: false, unique:true, default: ""
      t.string :title, null: false, default: ""
      t.text :description, null: false
      t.string :image, null: false, default: ""
      t.timestamps
    end
  end
end
