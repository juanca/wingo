require "test_helper"

class TilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tile = tiles(:two)
  end

  test "should get new" do
    get new_lobby_tile_url(@tile.lobby)
    assert_response :success
  end

  test "should create tile" do
    assert_difference("Tile.count") do
      post lobby_tiles_url(@tile.lobby), params: { tile: { body: @tile.body } }
    end

    assert_redirected_to edit_lobby_url(@tile.lobby)
  end

  test "should show tile" do
    get lobby_tile_url(@tile.lobby, @tile)
    assert_response :success
  end

  test "should get edit" do
    get edit_lobby_tile_url(@tile.lobby, @tile)
    assert_response :success
  end

  test "should update tile" do
    patch lobby_tile_url(@tile.lobby, @tile), params: { tile: { body: @tile.body, lobby_id: @tile.lobby_id } }
    assert_redirected_to edit_lobby_url(@tile.lobby)
  end

  test "should destroy tile" do
    assert_difference("Tile.count", -1) do
      delete lobby_tile_url(@tile.lobby, @tile)
    end

    assert_redirected_to edit_lobby_url(@tile.lobby)
  end
end
