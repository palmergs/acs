class Api::V1::RegionsController < ApiController
  def index
    @regions = Region.all
    render json: RegionSerializer.new(@regions).serializable_hash
  end

  def show
    @region = Region.find(params[:id])
    render json: RegionSerializer.new(@region).serializable_hash
  end

  def update
    @region = Region.find(params[:id])
    if @region.update(update_params)
      render json: RegionSerializer.new(@region).serializable_hash
    else
      render json: { errors: @region.errors }, status: :unprocessable_entity
    end
  end

  def create
    @region = Region.new(create_params)
    if @region.save
      render json: RegionSerializer.new(@region).serializable_hash, status: :created
    else
      render json: { errors: @region.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @region = Region.find(params[:id])
    render json: {}
  end

  private

  def create_params
    params.from_jsonapi.
        require(:region).
        permit(:name, :descr)
  end

  def update_params
    params.from_jsonapi.
        require(:region).
        permit(:name, :descr)
  end
end
