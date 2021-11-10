require "bcrypt"

class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[create login]
  skip_before_action :check_is_admin, only: %i[last_week_catches create login show current_user update destroy]
  before_action :set_user, only: %i[show update destroy last_week_catches]

  # GET /users
  def index
    @users = User.select(:id, :email, :name, :created_at, :connected_at).all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  def current_user
    token = auth_header.split(" ")[1]
    user_id = JWT.decode(token, nil, false)[0]["user_id"]
    user = User.find(user_id)

    render json: { "token" => token, "user_info" => user }
  end

  def last_week_catches
    amos = Amo.where(user_id: @user.id)
    res = []
    # dates = [Time.zone.today, Time.zone.today - 1.week]

    amos.each do |el|
      res << { el.name => Catch.where(amos_id: el.id) }
    end

    render json: { amo: res }
  end

  # POST /users
  def create
    user_info = JSON.parse(request.body.read)
    user = {
      id: SecureRandom.uuid,
      email: user_info["email"],
      name: user_info["name"],
      password: BCrypt::Password.create(user_info["password"])
    }
    @user = User.new(user)

    begin
      @user.save
      render json: @user, status: :created, location: @user
    rescue StandardError => e
      render json: { message: "users already exists" }, status: :unprocessable_entity
      Rails.logger.debug e
    end
  end

  def login
    user_info = JSON.parse(request.body.read)
    user = User.find_by(email: user_info["email"])
    password = BCrypt::Password.new(user.password) unless user.nil?
    if password == user_info["password"]
      User.update_connected_at(user)
      payload = { user_id: user.id, is_admin: user.is_admin }
      token = JWT.encode(payload, nil, "HS256")
      render json: { "token" => token, "user_info" => user }
    else
      render json: { message: "undefined users" }, status: :unauthorized
    end
  end

  # PATCH/PUT /users/1
  def update
    user_info = JSON.parse(request.body.read)
    user = {
      email: user_info["email"],
      name: user_info["name"],
      password: BCrypt::Password.create(user_info["password"])
    }
    if @user.update(user)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  rescue StandardError => e
    render json: { message: "undefined users" }, status: :unprocessable_entity
    Rails.logger.error e
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:name, :password, :email)
  end
end
