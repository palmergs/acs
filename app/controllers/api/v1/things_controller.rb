class Api::V1::ThingsController < ApiController
  def index
    @things = Thing.all
    render json: ThingSerializer.new(@things).serializable_hash
  end

  def show
    @thing = Thing.find(params[:id])
    render json: ThingSerializer.new(@thing).serializable_hash
  end

  def update
    @thing = Thing.find(params[:id])
    if @thing.update(update_params)
      render json: ThingSerializer.new(@thing).serializable_hash
    else
      render json: { errors: @thing.errors }, status: :unprocessable_entity
    end
  end

  def create
    @thing = Thing.new(create_params)
    if @thing.save
      render json: ThingSerializer.new(@thing).serializable_hash, status: :created
    else
      render json: { errors: @thing.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @thing = Thing.find(params[:id])
    render json: {}
  end

  private

  def create_params
    params.from_jsonapi.
        require(:thing).
        permit(:name, :descr)
  end

  def update_params
    params.from_jsonapi.
        require(:thing).
        permit(:name, :descr)
  end
end
