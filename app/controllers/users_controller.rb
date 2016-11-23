class UsersController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:notice] = "user was successfully created"
        redirect_to user_path(@user)
      else
        render 'new'
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to user_path(@user)
      else
        render 'edit'

      end
    end

    def show
      @user = User.find(params[:id])
    end

    private
      def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password)
      end

end
