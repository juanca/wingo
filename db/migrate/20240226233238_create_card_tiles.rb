class CreateCardTiles < ActiveRecord::Migration[7.1]
  def change
    create_table :card_tiles do |t|
      t.references :card, null: false, foreign_key: true
      t.references :tile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
