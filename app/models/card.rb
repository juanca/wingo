class Card < ApplicationRecord
  belongs_to :lobby
  has_many :card_tiles, dependent: :destroy
  accepts_nested_attributes_for :card_tiles
  has_many :tiles, through: :card_tiles

  scope :winners, -> { where.not(won_at: nil).order(:won_at) }

  validates_presence_of :title

  def has_won?
    horizontal_rows = [
      card_tiles.slice(0, 5),
      card_tiles.slice(5, 5),
      card_tiles.slice(10, 5),
      card_tiles.slice(15, 5),
      card_tiles.slice(20, 5)
    ]
    vertical_rows = horizontal_rows.transpose
    diagonal_rows = [
      horizontal_rows.map.with_index { |row, index| row[index] },
      horizontal_rows.reverse.map.with_index { |row, index| row[index] },
    ]

    horizontal_rows.any? { |row| row.all? { |card_tile| card_tile.marked } } or
      vertical_rows.any? { |row| row.all? { |card_tile| card_tile.marked } } or
      diagonal_rows.any? { |row| row.all? { |card_tile| card_tile.marked } }
  end
end
