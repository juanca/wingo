require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test "should create card" do
    visit lobby_url(@card.lobby)
    click_on "Join the game!"

    fill_in "Title", with: @card.title
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "should update Card" do
    visit lobby_card_url(@card.lobby, @card)
    click_on "Edit this card", match: :first

    fill_in "Title", with: @card.title
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "should destroy Card" do
    visit lobby_card_url(@card.lobby, @card)
    click_on "Destroy this card", match: :first

    assert_text "Card was successfully destroyed"
  end
end
