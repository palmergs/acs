class Api::V1::CreaturesController < ApiController
  def index
    @creatures = Creature.all
    render json: CreatureSerializer.new(@creatures).serializable_hash
  end

  def show
    @creature = Creature.find(params[:id])
    render json: CreatureSerializer.new(@creature).serializable_hash
  end

  def update
    @creature = Creature.find(params[:id])
    if @creature.update(update_params)
      render json: CreatureSerializer.new(@creature).serializable_hash
    else
      render json: { errors: @creature.errors }, status: :unprocessable_entity
    end
  end

  def create
    @creature = Creature.new(create_params)
    if @creature.save
      render json: CreatureSerializer.new(@creature).serializable_hash, status: :created
    else
      render json: { errors: @creature.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @creature = Creature.find(params[:id])
    render json: {}
  end

  private

  def create_params
    params.from_jsonapi.
        require(:creature).
        permit(:name, :descr)
  end

  def update_params
    params.from_jsonapi.
        require(:creature).
        permit(:name, :descr)
  end
end
