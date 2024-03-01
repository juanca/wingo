class AddMarkedToCardTiles < ActiveRecord::Migration[7.1]
  def change
    add_column :card_tiles, :marked, :boolean
  end
end
