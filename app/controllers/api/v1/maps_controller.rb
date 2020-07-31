# frozen_string_literal: true

class Api::V1::MapsController < ApiController
  def index
    filter = params.fetch(:filter, {})
    @maps = Map.
        in_adventure(filter).
        by_name(filter)
    render json: MapSerializer.new(@maps).serializable_hash
  end

  def show
    @map = Map.find(params[:id])
    render json: MapSerializer.new(@map).serializable_hash
  end

  def update
    @map = Map.find(params[:id])
    if @map.update(update_params)
      render json: MapSerializer.new(@map).serializable_hash
    else
      render json: { errors: @map.errors }, status: :unprocessable_entity
    end
  end

  def create
    @map = Map.new(create_params)
    if @map.save
      render json: MapSerializer.new(@map).serializable_hash, status: :created
    else
      render json: { errors: @map.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @map = Map.find(params[:id])
    render json: {}
  end

  private

  def create_params
    params.from_jsonapi.
        require(:map).
        permit(:adventure_id, :name, :descr)
  end

  def update_params
    params.from_jsonapi.
        require(:map).
        permit(:name, :descr)
  end
end
