class SessionsController < ApplicationController
  def new
  end

  def my_course
    # flash[:success] = 'Log in successfully'
    @courses = current_user.courses
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = 'Log in successfully'
      redirect_to(:action => 'my_course')
    else
      flash[:danger] = 'Incorrect username or password!' # 不完全正确
      render 'new'
    end
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  private
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
