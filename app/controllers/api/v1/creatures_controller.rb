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
      render json: { errors: @creature.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @creature = Creature.find(params[:id])
    if @creature.update_attributes(update_creature_params)
      render json: @creature
    else
      render json: { errors: @creature.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @creature = Creature.find(params[:id])
    @creature.destroy
    render json: {}
  end

  private

    def create_creature_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, 
          only: [ # :type,
            :adventure_id,
            :tile_picture_id,
            :name, 
            :description,
            :speed,
            :life_force,
            :constitution,
            :power,
            :wisdom,
            :strength,
            :size,
            :dexterity,
            :missile_skill,
            :armor_skill,
            :dodge_skill,
            :melee_skill,
            :parry_skill,
            :magical_defense,
            :personality,
            :outlook,
            :alliance ])
    end

    def update_creature_params
      ActiveModelSerializers::Deserialization.jsonapi_parse(params, 
          only: [ # :type,
            :adventure_id,
            :tile_picture_id,
            :name, 
            :description,
            :speed,
            :life_force,
            :constitution,
            :power,
            :wisdom,
            :strength,
            :size,
            :dexterity,
            :missile_skill,
            :armor_skill,
            :dodge_skill,
            :melee_skill,
            :parry_skill,
            :magical_defense,
            :personality,
            :outlook,
            :alliance ])
    end
end
