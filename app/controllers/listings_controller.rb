class ListingsController < ApplicationController
  before_action :set_listing, only: [:edit, :update, :show]
  before_action :require_user
  before_action :require_same_user, only: [:edit, :update]

  def new
    @listing = Listing.new
  end

  def create
    parameters = listing_params
    parameters[:user] = User.find(session[:user_id])
    @listing = Listing.new(parameters)
    if @listing.save
      flash[:sucess] = "Listing was successfully created"
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

  def index
    if params[:search]
      @listings = Listing.search(params[:search])
    elsif params[:adv_search]
      unless params[:min_price]
        params[:min_price] = 0
      end
      unless params[:max_price]
        params[:max_price] = 9999999.99
      end
      @listings = Listing.where("price GREATER_THAN_OR_EQUAL_TO ? AND price LESS_THAN_OR_EQUAL_TO ? AND title LIKE ? AND address LIKE ? AND (firstname LIKE ? OR lastname LIKE ? OR email LIKE ?)",
                                "#{params[:min_price]}", "#{params[:max_price]}", "%#{params[:title]}%", "%#{params[:address]}%", "%#{params[:user]}%", "%#{params[:user]}%", "%#{params[:user]}%")
    else
      @listings = Listing.all
    end
    @listings = @listings.order('created_at DESC')
  end

  def advanced
    redirect_to listings_path(adv_search: adv_search_params)
  end

  private
    def listing_params
      params.require(:listing).permit(:price, :title, :address, :description)
    end

    def adv_search_params
      params.require(:adv_search).permit(:min_price, :max_price, :address, :description, :user)
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
