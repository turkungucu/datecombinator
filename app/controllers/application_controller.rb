class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
  
  # Devise: Where to redirect users once they have logged in
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      super
    else
      account_path
    end
  end

end