class AddTextToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :picks, :text, :string, null: false, default: ""
  end
end
