class ProfileImagesController < ApplicationController
  before_filter :authenticate_admin!
  
  def create
    @profile = Profile.find(params[:profile_id])
    @profile_image = @profile.profile_images.create(params[:profile_image])
    redirect_to profile_path(@profile)
  end
  
  def destroy
    @profile = params[:profile_id]
    @profile_image = ProfileImage.find(params[:id])
    @profile_image.destroy

    respond_to do |format|
      format.html { redirect_to profile_url(@profile) }
      format.json { head :ok }
    end
  end
  
end
