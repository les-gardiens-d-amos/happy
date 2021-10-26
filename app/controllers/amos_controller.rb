class AmosController < ApplicationController
  skip_before_action :authorized
  before_action :set_amo, only: [:show, :update, :destroy]

  # GET /amos
  def index
    @amos = Amo.all

    render json: @amos
  end

  # GET /amos/1
  def show
    render json: @amo
  end

  # POST /amos
  def create
    @amo = Amo.new(amo_params)
    @amo.id = SecureRandom.uuid
    
    if @amo.save
      render json: @amo, status: :created, location: @amo
    else
      render json: @amo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /amos/1
  def update
    if @amo.update(amo_params)
      render json: @amo
    else
      render json: @amo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /amos/1
  def destroy
    @amo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_amo
      @amo = Amo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def amo_params
      params.permit(:id, :user_id, :animal_id, :species, :amos_type, :name, :image_path)
    end
end
