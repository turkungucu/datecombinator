class ProfileUrlsController < ApplicationController
  before_filter :authenticate_admin!
  
  def create
    @profile = Profile.find(params[:profile_id])
    @profile_url = @profile.profile_urls.create(params[:profile_url])
    redirect_to profile_path(@profile)
  end
  
  def destroy
    @profile = params[:profile_id]
    @profile_url = ProfileUrl.find(params[:id])
    @profile_url.destroy

    respond_to do |format|
      format.html { redirect_to profile_url(@profile) }
      format.json { head :ok }
    end
  end
end
