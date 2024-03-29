class CardsController < ApplicationController
  before_action :set_lobby
  before_action :set_card, only: %i[ show edit update destroy ]

  # GET /cards/1 or /cards/1.json
  def show
  end

  # GET /cards/new
  def new
    @card = Card.new
    sampled_tiles = @lobby.tiles.where.not(body: "FREE").sample(24)
    @card.tiles = sampled_tiles.slice(0, 12) + [@lobby.tiles.find_by!(body: "FREE")] +  sampled_tiles.slice(12..)
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards or /cards.json
  def create
    @card = Card.new(card_params.merge(lobby_id: @lobby.id))

    respond_to do |format|
      if @card.save
        format.html { redirect_to lobby_card_url(@lobby, @card), notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cards/1 or /cards/1.json
  def update
    respond_to do |format|
      if @card.update(card_params.except(:card_tiles_attributes))
        format.html { redirect_to lobby_card_url(@lobby, @card), notice: "Card was successfully updated." }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1 or /cards/1.json
  def destroy
    @card.destroy!

    respond_to do |format|
      format.html { redirect_to lobby_url(@lobby), notice: "Card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lobby
      @lobby = Lobby.find(params[:lobby_id])
    end

    def set_card
      @card = Card.preload(:card_tiles, :tiles).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:title, card_tiles_attributes: [:tile_id])
    end
end
