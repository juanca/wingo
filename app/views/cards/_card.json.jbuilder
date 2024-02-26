json.extract! card, :id, :lobby_id, :title, :created_at, :updated_at
json.url lobby_card_url(@lobby, card, format: :json)
