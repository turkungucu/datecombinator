class FavoritesController < ApplicationController
  before_filter :authenticate_user!
  layout "account", :only => [:index]
  
  def index
    @favorites = current_user.favorites
    @profiles = []
    @favorites.each do | fav |
      @profiles.push(Profile.find(fav.profile_id))
    end
    
    @profiles = @profiles.paginate :page => params[:page], :per_page => 10
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end
  
  def add_to_favorites
    @favorite = Favorite.new(:user_id => current_user.id, :profile_id => params[:id])
    @favorite.save
    respond_to do |format|
      #format.html # search.html.erb
      format.js
    end
  end
  
  def remove_from_favorites
    @favorite = Favorite.find_by_user_id_and_profile_id(current_user.id, params[:id])
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to favorites_url }
      format.json { head :ok }
    end
  end
end
