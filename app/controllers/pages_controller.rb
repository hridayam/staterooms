class PagesController < ApplicationController
  def home
    redirect_to listings_path if logged_in?
  end
end
