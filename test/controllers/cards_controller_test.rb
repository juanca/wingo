require "test_helper"

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get new" do
    get new_lobby_card_url(@card.lobby)
    assert_response :success
  end

  test "should create card" do
    assert_difference("Card.count") do
      post lobby_cards_url(@card.lobby), params: { card: { lobby_id: @card.lobby_id, title: @card.title } }
    end

    assert_redirected_to lobby_card_url(@card.lobby, Card.last)
  end

  test "should show card" do
    get lobby_card_url(@card.lobby, @card)
    assert_response :success
  end

  test "should get edit" do
    get edit_lobby_card_url(@card.lobby, @card)
    assert_response :success
  end

  test "should update card" do
    patch lobby_card_url(@card.lobby, @card), params: { card: { lobby_id: @card.lobby_id, title: @card.title } }
    assert_redirected_to lobby_card_url(@card.lobby, @card)
  end

  test "should destroy card" do
    assert_difference("Card.count", -1) do
      delete lobby_card_url(@card.lobby, @card)
    end

    assert_redirected_to lobby_url(@card.lobby)
  end
end
