module FavoritesHelper
  def is_favorite?(profile_id)
    if user_signed_in?
      Favorite.find_by_user_id_and_profile_id(current_user.id, profile_id)      
    end
  end
  
  def favorites_controller?
    !!(controller.controller_name == "favorites")
  end
  
end
