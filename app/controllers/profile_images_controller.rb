class ProfileImagesController < ApplicationController
  before_filter :authenticate_admin!
  
  def create
    @profile = Profile.find(params[:profile_id])
    @profile_image = @profile.profile_images.create(params[:profile_image])
    redirect_to profile_path(@profile)
  end
end
