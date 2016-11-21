class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email:params[:session][:email], password:params[:session][:password])
    if user
      render users_path
    else
      render 'new'
    end
  end

  def destroy
  end
end
