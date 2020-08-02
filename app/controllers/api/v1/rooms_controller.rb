class Api::V1::RoomsController < ApiController
  def index
    @rooms = Room.all
    render json: RoomSerializer.new(@rooms).serializable_hash
  end

  def show
    @room = Room.find(params[:id])
    render json: RoomSerializer.new(@room).serializable_hash
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(update_params)
      render json: RoomSerializer.new(@room).serializable_hash
    else
      render json: { errors: @room.errors }, status: :unprocessable_entity
    end
  end

  def create
    @room = Room.new(create_params)
    if @room.save
      render json: RoomSerializer.new(@room).serializable_hash, status: :created
    else
      render json: { errors: @room.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    render json: {}
  end

  private

  def create_params
    params.from_jsonapi.
        require(:room).
        permit(:region_id,
               :name,
               :descr,
               :width,
               :height,
               :region_x,
               :region_y,
               :wall_tile_idx)
  end

  def update_params
    params.from_jsonapi.
        require(:room).
        permit(:name,
               :descr,
               :width,
               :height,
               :region_x,
               :region_y,
               :wall_tile_idx)
  end
end
