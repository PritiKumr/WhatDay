class Api::V1::UserController < Api::V1::ApplicationController
  before_action :session_validate, except: [:login]
  before_action :set_user, except: [:login]
  def login
    @user = User.find_by(email: params[:user][:email])
    session[:user_auth_token] = @user.token
    render '/api/v1/users/login.json.jbuilder'
  end

  def state_logs
    state = State.new(user_id: params[:user_id], state: params[:state_logs][:state], date: params[:state_logs][:date])
    if state.save
      render json: { success: true, message: 'State logged successfully.'}, status: 200
    end
  end

  def state_logs_between
    @state_logs = State.where(user_id: @current_user.id).where(date: params[:from_date]..params[:to_date])
    render '/api/v1/users/state_logs.json.jbuilder'
  end

  private

  def session_validate
    if session[:user_auth_token] != request.headers["Access-Token"]
      render json: { success: false, response: { message: 'Invalid User'}}, status: 400
    end
  end

  def set_user
    return false unless session[:user_auth_token]
    @current_user ||= User.find_by(token: session[:user_auth_token])
  end

end
