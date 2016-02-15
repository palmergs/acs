class Api::V1::RoomsController < ApplicationController
  def index
    @rooms = Room.page(params[:p]).per(20)
    render json: @rooms
  end

  def show
    @room = Room.find(params[:id])
    render json: @room
  end

  def create
    @room = Room.new(create_room_params)
    if @room.save
      render json: @room
    else
      render json: { errors: @room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @room = Room.find(params[:id])
    if @room.update_attributes(update_room_params)
      render json: @room
    else
      render json: { errors: @room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      render json: {}
    else
      render json: { errors: [ 'Unable to delete room.'] }, status: :unprocessable_entity
    end
  end

  private

    def create_room_params
      params.require(:room).permit(:region_id,
          :name,
          :description,
          :width,
          :height,
          :x,
          :y)
    end

    def update_room_params
      params.require(:room).permit(:name,
          :description,
          :width,
          :height,
          :x,
          :y)
    end
end
