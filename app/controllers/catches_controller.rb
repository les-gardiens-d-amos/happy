class CatchesController < ApplicationController
  before_action :set_catch, only: [:show, :update, :destroy]

  # GET /catches
  def index
    @catches = Catch.all

    render json: @catches
  end

  # GET /catches/1
  def show
    render json: @catch
  end

  # POST /catches
  def create
    @catch = Catch.new(catch_params)

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
      params.permit(:long, :lat, :altitude, :accuracy)
    end
end
