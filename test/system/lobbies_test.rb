require "application_system_test_case"

class LobbiesTest < ApplicationSystemTestCase
  setup do
    @lobby = lobbies(:two)
  end

  test "visiting the index" do
    visit lobbies_url
    assert_selector "table", id: "lobbies"
  end

  test "should create lobby" do
    visit lobbies_url
    click_on "New lobby"

    fill_in "Title", with: @lobby.title
    click_on "Create"

    assert_text "Lobby was successfully created"
  end

  test "should update Lobby" do
    visit lobby_url(@lobby)
    click_on "Edit", match: :first

    fill_in "Title", with: @lobby.title
    click_on "Update"

    assert_text "Lobby was successfully updated"
  end

  test "should destroy Lobby" do
    visit lobby_url(@lobby)
    click_on "Edit", match: :first
    click_on "Destroy", match: :first

    assert_text "Lobby was successfully destroyed"
  end
end
