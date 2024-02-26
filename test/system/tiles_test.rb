require "application_system_test_case"

class TilesTest < ApplicationSystemTestCase
  setup do
    @tile = tiles(:one)
  end

  test "visiting the index" do
    visit lobby_tiles_url(@tile.lobby)
    assert_selector "h1", text: "Tiles"
  end

  test "should create tile" do
    visit lobby_tiles_url(@tile.lobby)
    click_on "New tile"

    fill_in "Body", with: @tile.body
    click_on "Create Tile"

    assert_text "Tile was successfully created"
    click_on "Back"
  end

  test "should update Tile" do
    visit lobby_tile_url(@tile.lobby, @tile)
    click_on "Edit this tile", match: :first

    fill_in "Body", with: @tile.body
    click_on "Update Tile"

    assert_text "Tile was successfully updated"
    click_on "Back"
  end

  test "should destroy Tile" do
    visit lobby_tile_url(@tile.lobby, @tile)
    click_on "Destroy this tile", match: :first

    assert_text "Tile was successfully destroyed"
  end
end
