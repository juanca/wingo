require "test_helper"

class CardTilesControllerTest < ActionDispatch::IntegrationTest
  test "should mark a tile on a card" do
    card_tile = card_tiles(:one)

    patch lobby_card_tile_url(card_tile.card.lobby, card_tile.card, card_tile.tile), params: { tile: { marked: true } }
    assert_redirected_to lobby_card_url(card_tile.card.lobby, card_tile.card)
    assert card_tile.reload.marked
  end

  test "should unmark a tile on a card" do
    card_tile = card_tiles(:two)

    assert card_tile.reload.marked
    patch lobby_card_tile_url(card_tile.card.lobby, card_tile.card, card_tile.tile), params: { tile: { marked: false } }
    assert_redirected_to lobby_card_url(card_tile.card.lobby, card_tile.card)
    assert_not card_tile.reload.marked
  end
end
