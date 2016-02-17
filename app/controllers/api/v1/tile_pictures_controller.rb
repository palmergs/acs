class Api::V1::TilePicturesController < ApplicationController
  def index
    @tile_pictures = TilePicture.page(params[:p]).per(25)
    render json: @tile_pictures
  end

  def show
    @tile_picture = TilePicture.find(params[:id])
    render json: @tile_picture
  end

  def create
    @tile_picture = TilePicture.new(create_tile_picture_params)
    if @tile_picture.save
      render json: @tile_picture
    else
      render json: { errors: @tile_picture.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @tile_picture = TilePicture.find(params[:id])
    if @tile_picture.update_attributes(update_time_picture_params)
      render json: @tile_picture
    else
      render json: { errors: @tile_picture.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @tile_picture = TilePicture.find(params[:id])
    @tile_picture.destroy
    render json: {}
  end

  private

    def create_tile_picture_params
      params.require(:tile_picture).permit(:name, :description, :category, :setting)
    end

    def update_time_picture_params
      params.require(:tile_picture).permit(:name, :description, :category, :setting)
    end

end
