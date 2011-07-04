class ProfileUrlsController < ApplicationController
  before_filter :authenticate_admin!
  
  def create
    @profile = Profile.find(params[:profile_id])
    @profile_url = @profile.profile_urls.create(params[:profile_url])
    redirect_to profile_path(@profile)
  end
end
