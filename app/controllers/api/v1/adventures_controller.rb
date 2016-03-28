class Api::V1::AdventuresController < ApplicationController

  def index
    @adventures = Adventure.page(params[:p]).per(25)
    render json: @adventures
  end

  def show
    @adventure = Adventure.find(params[:id])
    render json: @adventure
  end

  def create
    @adventure = Adventure.new(create_adventure_params)
    if @adventure.save
      render json: @adventure
    else
      render json: { errors: @adventure.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @adventure = Adventure.find(params[:id])
    if @adventure.update_attributes(update_adventure_params)
      render json: @adventure
    else
      render json: { errors: @adventure.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @adventure = Adventure.find(params[:id])
    if @adventure.destroy
      render json: {}
    else
      render json: { errors: [ 'Unable to delete adventure.'] }, status: :unprocessable_entity
    end
  end

  private

    # def create_adventure_params
    #   Rails.logger.debug("create")
    #   Rails.logger.debug(params.inspect)
    #   params.require(:adventure).permit(:name,
    #       :description,
    #       :intro,
    #       :rating,
    #       :access)
    # end

    def create_adventure_params
      Rails.logger.debug(params.inspect)
      params.require(:data).permit(attributes: [
        :name, :description, :intro, :rating, :access
      ])
    end

    def update_adventure_params
      Rails.logger.debug("update")
      Rails.logger.debug(params.inspect)
      params.require(:adventure).permit(:name,
          :description,
          :intro,
          :rating,
          :access)
    end

end
