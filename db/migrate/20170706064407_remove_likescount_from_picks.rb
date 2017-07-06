class RemoveLikescountFromPicks < ActiveRecord::Migration[5.0]
  def change
    remove_column :picks, :likes_count, :integer
  end
end
