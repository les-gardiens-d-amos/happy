require "cloudinary"
require "json"
require "pry"

# temporally controller for test
class UploadImageController < ApplicationController
  skip_before_action :authorized
  skip_before_action :check_is_admin

  def upload_image
    Cloudinary.config_from_url ENV["CLOUDINARY_URL"]
    base64 = JSON.parse(request.body.read)["base64"]

    begin
      res = Cloudinary::Uploader.upload(base64)
      render json: res
    rescue StandardError => e
      Rails.logger.debug e
      render json: { error: e }
    end
  end

  def delete_image
    Cloudinary.config_from_url ENV["CLOUDINAY_URL"]
    image_id = params["image_id"]

    begin
      res = Cloudinary::Uploader.destroy(image_id)
      render json: { message: res }
    rescue StandardError => e
      Rails.logger.debug e
      render json: { error: e }
    end
  end
end
