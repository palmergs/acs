class Api::V1::ThingsController < ApplicationController
  def index
    @things = Thing.page(params[:p]).per(20)
    render json: @things
  end

  def show
    @thing = Thing.find(params[:id])
    render json: @thing
  end

  def create
    @thing = Thing.new(create_thing_params)
    if @thing.save
      render json: @thing
    else
      render json: @thing, status: :unprocessable_entity
    end
  end

  def update
    @thing = Thing.find(params[:id])
    if @thing.update_attributes(update_thing_params)
      render json: @thing
    else
      render json: @thing, status: :unprocessable_entity
    end
  end

  def destroy
    @thing = Thing.find(params[:id])
    @thing.destroy
    render json: {}
  end

  private

    def create_thing_params
      params.require(:thing).permit(:name, :description)
    end

    def update_thing_params
      params.require(:thing).permit(:name, :description)
    end
end
