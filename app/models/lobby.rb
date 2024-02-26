class Lobby < ApplicationRecord
  has_many :cards
  has_many :tiles
end
