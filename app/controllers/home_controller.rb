class HomeController < ApplicationController
  layout :resolve_layout
  
  def resolve_layout
    action_name == "index" ? "home" : "account"
  end
  
  def index
  end
  
  def how_it_works
  end
end
