class Lobby < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :tiles, dependent: :destroy

  validates_presence_of :title

  after_create do
    Tile.new(lobby_id: self.id, body: "FREE").save!
  end

  def generate_tiles(count)
    self.tiles << Array.new(count).fill { |index| Tile.new(body: index + 1) }
  end
end
