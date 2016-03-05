class Api::V1::CreaturesController < ApplicationController
  def index
    @creatures = Creature.page(params[:p]).per(25)
    render json: @creatures
  end

  def show
    @creature = Creature.find(params[:id])
    render json: @creature
  end

  def create
    @creature = Creature.new(create_creature_params)
    if @creature.save
      render json: @creature
    else
      render json: @creature, status: :unprocessable_entity
    end
  end

  def update
    @creature = Creature.find(params[:id])
    if @create.update_attributes(update_creature_params)
      render json: @creature
    else
      render json: @creature, status: :unprocessable_entity
    end
  end

  def destroy
    @creature = Creature.find(params[:id])
    @creature.destroy
    render json: {}
  end

  private

    def create_creature_params
      params.require(:creature).permit(:name, :description)
    end

    def update_creature_params
      params.require(:creature).permit(:name, :description)
    end
end
