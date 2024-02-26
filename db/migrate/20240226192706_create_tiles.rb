class CreateTiles < ActiveRecord::Migration[7.1]
  def change
    create_table :tiles do |t|
      t.references :lobby, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
