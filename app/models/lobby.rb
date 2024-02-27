class Lobby < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :tiles, dependent: :destroy
end
