class Api::V1::UserController < Api::V1::ApplicationController
  before_action :set_user, except: [:login]
  def login
    @user = User.find_by(email: params[:user][:email])
    render '/api/v1/users/login.json.jbuilder'
  end

  def state_logs
    state = State.find_or_create_by(user_id: params[:user_id], date: params[:state_logs][:date])
    state.state = params[:state_logs][:state]
    if state.save
      render json: { success: true, message: 'State logged successfully.'}, status: 200
    end
  end

  def state_logs_between
    @state_logs = State.where(user_id: @current_user.id).where(date: params[:from_date]..params[:to_date])
    render '/api/v1/users/state_logs.json.jbuilder'
  end

  private

  def set_user
    @current_user ||= User.find_by(token: request.headers["Access-Token"])
  end

end
