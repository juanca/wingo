class AddWonAtToCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :won_at, :datetime
  end
end
