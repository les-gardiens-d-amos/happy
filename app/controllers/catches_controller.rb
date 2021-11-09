class CatchesController < ApplicationController
  before_action :set_catch, only: %i[show update destroy]

  # GET /catches
  def index
    @catches = Catch.all
    catches_and_amos = []
    @catches.each do |el|
      catches_and_amos << {
        catches: el,
        species: Amo.find(el.amos_id).species
      }
    end

    render json: catches_and_amos
  end

  def amos_catches
    @catches = Catch.find_by(amos_id: catch_params[:amos_id])

    render json: @catches
  end

  # GET /catches/1
  def show
    render json: @catch
  end

  # POST /catches
  def create
    catch_info = JSON.parse(request.body.read)
    @catch = Catch.new(catch_info)
    @catch.id = SecureRandom.uuid

    if @catch.save
      render json: @catch, status: :created, location: @catch
    else
      render json: @catch.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /catches/1
  def update
    if @catch.update(catch_params)
      render json: @catch
    else
      render json: @catch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /catches/1
  def destroy
    @catch.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_catch
    @catch = Catch.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def catch_params
    params.permit(:long, :lat, :altitude, :accuracy, :amos_id)
  end
end
