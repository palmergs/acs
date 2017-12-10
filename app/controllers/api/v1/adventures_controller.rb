class Api::V1::AdventuresController < ApplicationController

  DEFAULT_PAGE_SIZE = 9

  def index
    @adventures = Adventure.
        order(created_at: :desc).
        page(params.fetch(:page, {}).fetch(:number, nil)).
        per(params.fetch(:page, {}).fetch(:size, DEFAULT_PAGE_SIZE))
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

    def create_adventure_params
      params.permit!
pp "in create_adventure_params... params=#{ params.inspect }"
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, 
          only: [ 
            :name, 
            :description,
            :intro,
            :rating,
            :access ])
    end

    def update_adventure_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, 
          only: [ 
            :name, 
            :description,
            :intro,
            :rating,
            :access ])
    end

end
