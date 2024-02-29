class Lobby < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :tiles, dependent: :destroy

  validates_presence_of :title

  after_create do
    Tile.new(lobby_id: self.id, body: "FREE").save!
  end
end
