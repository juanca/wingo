class CardTilesController < ApplicationController
  before_action :set_card_tile

  def update
    respond_to do |format|
      if @card_tile.update(card_tile_params)
        if @card.has_won? && @card.update({ won_at: DateTime.now })
          format.html { redirect_to lobby_card_url(@lobby, @card), notice: "Card is a winner!" }
          format.json { render :show, status: :ok, location: @card }
        else
          format.html { redirect_to lobby_card_url(@lobby, @card), notice: "Card was successfully updated." }
          format.json { render :show, status: :ok, location: @card }
        end

      else
        format.html { redirect_to lobby_card_url(@lobby, @card), notice: "Card was not updated.", status: :unprocessable_entity }
        format.json { render json: @card_tile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_card_tile
    @lobby = Lobby.find(params[:lobby_id])
    @card = @lobby.cards.find(params[:card_id])
    @tile = @lobby.tiles.find(params[:id])
    @card_tile = @card.card_tiles.find_by(card_id: @card.id, tile_id: @tile.id)
  end

  def card_tile_params
    params.require(:tile).permit(:marked)
  end
end
