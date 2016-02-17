class Api::V1::TerrainsController < ApplicationController
  def index
    @terrains = Terrain.page(params[:p]).per(20)
    render json: @terrains
  end

  def show
    @terrain = Terrain.find(params[:id])
    render json: @terrain
  end

  def create
    @terrain = Terrain.new(create_terrain_params)
    if @terrain.save
      render json: @terrain
    else
      render json: { errors: @terrain.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @terrain = Terrain.find(params[:id])
    if @terrain.update_attributes(update_terrain_params)
      render json: @terrain
    else
      render json: { errors: @terrain.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @terrain = Terrain.find(params[:id])
    @terrain.destroy
    render json: {}
  end

  private

    def create_terrain_params
      params.requires(:terrain).permit(:name, :description)
    end

    def update_terrain_params
      params.requires(:terrain).permit(:name, :description)
    end

end
