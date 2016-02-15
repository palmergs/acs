class Api::V1::MapsController < ApplicationController

  def index
    @maps = Map.page(params[:p]).per(20)
    render json: @maps
  end

  def show
    @map = Map.find(params[:id])
    render json: @map
  end

  def create
    @map = Map.new(create_map_params)
    if @map.save
      render json: @map
    else
      render json: { errors: @map.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @map = Map.find(params[:id])
    if @map.update_attributes(update_map_params)
      render json: @map
    else
      render json: { errors: @map.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @map = Map.find(params[:id])
    if @map.destroy
      render json: {}
    else
      render json: { errors: [ 'Unable to delete map.'] }, status: :unprocessable_entity
    end
  end

  private

    def create_map_params
      params.require(:map).permit(:adventure_id,
          :name,
          :description,
          :width,
          :height)
    end

    def update_map_params
      params.require(:map).permit(:name,
          :description,
          :width,
          :height)
    end

end
