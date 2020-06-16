class Api::V1::AdventuresController < ApiController
  def index
    @adventures = Adventure.all
    render json: AdventureSerializer.new(@adventures).serializable_hash
  end

  def show
    @adventure = Adventure.find(params[:id])
    render json: AdventureSerializer.new(@adventure).serializable_hash
  end

  def update
    @adventure = Adventure.find(params[:id])
    if @adventure.update(update_params)
      render json: AdventureSerializer.new(@adventure).serializable_hash
    else
      render json: { errors: @adventure.errors }, status: :unprocessable_entity
    end
  end

  def create
    @adventure = Adventure.new(create_params)
    if @adventure.save
      render json: AdventureSerializer.new(@adventure).serializable_hash, status: :created
    else
      render json: { errors: @adventure.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @adventure = Adventure.find(params[:id])
    render json: {}
  end

  private

  def create_params
    params.from_jsonapi.
        require(:adventure).
        permit(:name, :descr, :intro, :rating, :genre, :access, :sprite_map_id)
  end

  def update_params
    params.from_jsonapi.
        require(:adventure).
        permit(:name, :descr, :intro, :rating, :genre, :access, :sprite_map_id)
  end
end
