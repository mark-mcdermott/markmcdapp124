class SessionsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create]

  def welcome
    render 'static_pages/home'
  end

  def create
    @user = User.find_by(username: params[:username])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
    end
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil 
    redirect_to '/'
  end
end
