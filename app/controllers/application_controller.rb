class ApplicationController < ActionController::API
  around_action :manage_error
  before_action :authorized

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, nil, false)
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def logged_in_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!logged_in_user
  end

  def authorized
    if ENV['RAILS_ENV'] != "test"
      render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
  end

  protected

  def manage_error
    begin
      yield
    rescue StandardError => err
      if ENV["RAILS_ENV"] == "production"
        error_info = { name: request, description: params, error: err, stack_trace: err.backtrace.join("/n") }
        FailedJob.new(error_info).save
        DiscordErrorService.new(request, params, err, err.backtrace.join("/n")).send_error_back  
      end
      raise err
    end
  end
end
