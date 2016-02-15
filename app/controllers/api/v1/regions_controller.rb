class Api::V1::RegionsController < ApplicationController

  def index
    @regions = Region.page(params[:p]).per(20)
    render json: @regions
  end

  def show
    @region = Region.find(params[:id])
    render json: @region
  end

  def create
    @region = Region.new(create_region_params)
    if @region.save
      render json: @region
    else
      render json: { errors: @region.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @region = Region.find(params[:id])
    if @region.update_attributes(update_region_params)
      render json: @region
    else
      render json: { errors: @region.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @region = Region.find(params[:id])
    if @region.destroy
      render json: {}
    else
      render json: { errors: [ 'Unable to delete region.'] }, status: :unprocessable_entity
    end
  end

  private

    def create_region_params
      params.require(:region).permit(:map_id,
          :name,
          :description,
          :width,
          :height,
          :x,
          :y)
    end

    def update_region_params
      params.require(:region).permit(:name,
          :description,
          :width,
          :height,
          :x,
          :y)
    end

end
