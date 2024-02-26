class CreateLobbies < ActiveRecord::Migration[7.1]
  def change
    create_table :lobbies do |t|
      t.string :title

      t.timestamps
    end
  end
end
