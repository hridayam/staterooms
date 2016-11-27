class ListingsController < ApplicationController
  def new
    @listing = Listing.new
  end

  def create
    parameters = listing_params
    parameters[:user] = User.find(session[:user_id])
    @listing = Listing.new(parameters)
    if @listing.save
      flash[:notice] = "Listing was successfully created"
      redirect_to listing_path(@listing)
    else
      render 'new'
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to listing_path(@listing)
    else
      render 'edit'
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private
    def listing_params
      params.require(:listing).permit(:price, :title, :address, :description)
    end
end
