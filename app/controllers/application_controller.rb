class ApplicationController < ActionController::API
  around_action :manage_error
  before_action :authorized
  before_action :check_is_admin

  def auth_header
    request.headers["Authorization"]
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split(" ")[1]
    begin
      @jwt_decoded = JWT.decode(token, nil, false)
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]["user_id"]
    @user = User.find_by(id: user_id)
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    render json: { message: "Please log in" }, status: :unauthorized if ENV["RAILS_ENV"] != "test" && !logged_in?
  end

  def check_is_admin
    render json: { message: "not authorized" }, status: :unauthorized unless @jwt_decoded[0]["is_admin"]
  end

  protected

  def manage_error
    yield
  rescue StandardError => e
    if ENV["RAILS_ENV"] == "production"
      error_info = { name: request, description: params, error: e, stack_trace: e.backtrace.join("/n") }
      FailedJob.new(error_info).save
      DiscordErrorService.new(request, params, e, e.backtrace.join("/n")).send_error_back
    end
    raise e
  end
end
