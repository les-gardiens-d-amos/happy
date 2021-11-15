require "pry"

class AmosController < ApplicationController
  before_action :set_amo, only: %i[show update destroy]
  skip_before_action :check_is_admin, only: %i[create show user_amos animal_id update update_name destroy]

  # GET /amos
  def index
    @amos = Amo.all

    render json: @amos
  end

  # GET /amos/1
  def show
    render json: @amo
  end

  # GET /amos/user_id
  def user_amos
    @amo = Amo.where(user_id: amo_params[:user_id])

    render json: @amo
  end

  def animal_id
    @animal_id = Amo.find_animal_id_by_user(amo_params[:user_id])

    render json: { animal_id: @animal_id }
  end

  # POST /amos
  def create
    amo_info = JSON.parse(request.body.read)
    # binding.pry
    @amo = Amo.new(amo_info)
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

  def update_name
    name = JSON.parse(request.body.read)["name"]
    @amo = Amo.change_amos_name(amo_params[:id], name)
    render json: @amo
  end

  # DELETE /amos/1
  def destroy
    begin
      Catch.remove_catch_with_amo(params[:id])
    rescue StandardError => e
      Rails.logger.debug e
    end
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
