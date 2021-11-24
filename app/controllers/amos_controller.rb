require "pry"
require "cloudinary"
require "json"

class AmosController < ApplicationController
  before_action :set_amo, only: %i[show update destroy]
  before_action :set_cloudinary, only: %i[create destroy]
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
    image_id_and_path = upload_amos_image(amo_info["base64"])
    amo_info.delete("base64")
    @amo = Amo.new(amo_info)
    @amo.id = SecureRandom.uuid
    @amo.image_path = image_id_and_path[:image_path]
    @amo.image_id = image_id_and_path[:image_id]

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
    remove_amos_image(@amo.image_id)
    @amo.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_amo
    @amo = Amo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def amo_params
    params.permit(:id, :user_id, :animal_id, :species, :amos_type, :name)
  end

  # cloudinary method =>
  def set_cloudinary
    Cloudinary.config_from_url ENV["CLOUDINARY_URL"]
  end

  def upload_amos_image(base64)
    res = Cloudinary::Uploader.upload(base64)
    { image_id: res["public_id"], image_path: res["secure_url"] }
  end

  def remove_amos_image(image_id)
    Cloudinary::Uploader.destroy(image_id)
  end
end
