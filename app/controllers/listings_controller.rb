class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :update, :show, :destroy]
  before_action :require_user
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @listing = Listing.new
  end

  def create
    parameters = listing_params
    parameters[:user] = User.find(session[:user_id])
    @listing = Listing.new(parameters)
    if @listing.save
      flash[:success] = "Listing was successfully created"
      redirect_to listing_path(@listing)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      flash[:success] = "Your listing was updated successfully"
      redirect_to listing_path(@listing)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    if @listing.destroy
      flash[:success] = "Your listing was updated successfully"
      redirect_to listings_path
    else
      flash[:danger] = "something went wrong"
      redirect_to listings_path
    end
  end

  def index
    if params[:search]
      @listings = Listing.search(params[:search])
    else
      @listings = Listing.all
    end
    @listings = @listings.order('created_at DESC')
  end

  private
    def listing_params
      params.require(:listing).permit(:price, :title, :address, :description, :cover)
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def require_same_user
      if current_user != @listing.user
        flash[:danger] = "You can only edit your own Listing"
        redirect_to root_path
      end
    end
end
