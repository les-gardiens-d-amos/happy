require 'bcrypt'

class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :login] 
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    user_info = JSON.parse(request.body.read)
    user = {
      :id => SecureRandom.uuid,
      :email => user_info["email"],
      :name => user_info["name"],
      :password => BCrypt::Password.create(user_info["password"])
    }
    @user = User.new(user)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    user_info = JSON.parse(request.body.read)
    user = User.find_by_email(user_info["email"])
    password = BCrypt::Password.new(user.password)
    if password == user_info["password"]
      payload = { user_id: user.id }
      token = JWT.encode(payload, nil, 'HS256')
      render json: { "token" => token }
    else
      render json: { "error" => "undefined users" }
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
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
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # params.require(:user).permit(:name, :password)
      params.permit(:name, :password)
    end
end
