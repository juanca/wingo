class Card < ApplicationRecord
  belongs_to :lobby
  has_many :card_tiles, dependent: :destroy
  accepts_nested_attributes_for :card_tiles
  has_many :tiles, through: :card_tiles
end
