class Card < ApplicationRecord
  belongs_to :lobby
  has_many :card_tiles, dependent: :destroy
  has_many :tiles, through: :card_tiles
end
