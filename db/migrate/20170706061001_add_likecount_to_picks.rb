class AddLikecountToPicks < ActiveRecord::Migration[5.0]
  def change
    add_column :picks, :likes_count, :integer
  end
end
