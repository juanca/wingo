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
    click_on "Create Lobby"

    assert_text "Lobby was successfully created"
    click_on "Back"
  end

  test "should update Lobby" do
    visit lobby_url(@lobby)
    click_on "Edit this lobby", match: :first

    fill_in "Title", with: @lobby.title
    click_on "Update Lobby"

    assert_text "Lobby was successfully updated"
    click_on "Back"
  end

  test "should destroy Lobby" do
    visit lobby_url(@lobby)
    click_on "Edit this lobby", match: :first
    click_on "Destroy this lobby", match: :first

    assert_text "Lobby was successfully destroyed"
  end
end
