class TilesController < ApplicationController
  before_action :set_lobby
  before_action :set_tile, only: %i[ edit update destroy ]

  # GET /tiles/new
  def new
    @tile = Tile.new
  end

  # GET /tiles/1/edit
  def edit
  end

  # POST /tiles or /tiles.json
  def create
    @tile = Tile.new(tile_params.merge(lobby_id: @lobby.id))

    respond_to do |format|
      if @tile.save
        format.html { redirect_to edit_lobby_url(@lobby), notice: "Tile was successfully created." }
        format.json { render :show, status: :created, location: @tile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiles/1 or /tiles/1.json
  def update
    respond_to do |format|
      if @tile.update(tile_params)
        format.html { redirect_to edit_lobby_url(@lobby), notice: "Tile was successfully updated." }
        format.json { render :show, status: :ok, location: @tile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiles/1 or /tiles/1.json
  def destroy
    @tile.destroy!

    respond_to do |format|
      format.html { redirect_to edit_lobby_url(@lobby), notice: "Tile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lobby
      @lobby = Lobby.find(params[:lobby_id])
    end

    def set_tile
      @tile = Tile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tile_params
      params.require(:tile).permit(:lobby_id, :body)
    end
end
