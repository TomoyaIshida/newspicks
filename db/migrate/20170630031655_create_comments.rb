class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user,foreign_key: true, index: true
      t.references :pick,foreign_key: true, index: true
      t.text :body,null: false
      t.timestamps
    end
  end
end
