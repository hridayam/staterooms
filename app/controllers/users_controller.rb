class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_user, except: [:new, :create, :confirm_email]
  before_action :require_same_user, only: [:edit, :update]
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "User was successfully created. Please activate your account by clicking on the link received in email address"
        UserMailer.registration_confirmation(@user).deliver
        redirect_to root_url
      else
        render 'new'
      end
    end

    def edit
    end

    def update
      if @user.update(user_params)
        flash[:success] = "Your account was updated successfully"
        redirect_to user_path(@user)
      else
        render 'edit'

      end
    end

    def show
    end

    def confirm_email
      user = User.find_by_confirm_token(params[:id])
      if user
        user.email_activate
        flash[:success] = "Welcome to the State rooms! Your email has been confirmed.
        Please sign in to continue."
        redirect_to login_path
      else
        flash[:error] = "Sorry. User does not exist"
        redirect_to root_url
      end
    end

    private
      def user_params
        params.require(:user).permit(:firstname, :lastname, :email, :password)
      end

      def set_user
        @user = User.find(params[:id])
      end

      def require_same_user
        if current_user != @user
          flash[:danger] = "You can only edit your own Account"
          redirect_to root_path
        end
      end

end
