require 'zip_codes_helper'

class ProfilesController < ApplicationController
  before_filter :authenticate_admin!, :except => [:search, :clickout, :details]
  layout :resolve_layout
  
  def resolve_layout
    action_name == "search" ? "application" : "account"
  end
  
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :ok }
    end
  end
  
  def search
    cond_hash = {:date_of_birth => 
                  (Time.now - Integer(params[:age_to]).year)..(Time.now - Integer(params[:age_from]).year), 
                  :gender => params[:seeking_gender], 
                  :seeking_gender => params[:gender]
                 }
    
    zc = params[:zip_code]
    if !zc.nil? and !zc.empty?
      zip_codes = ZipCodesHelper.get_nearby_zip_codes(zc, params[:within].to_i)
      cond_hash[:zip_code] = zip_codes
    end
    
    ethnicity = params[:ethnicity]
    unless ethnicity.blank?
      cond_hash[:ethnicity] = ethnicity
    end
    
    @profiles = Profile.where(cond_hash).paginate :page => params[:page], :per_page => 10
    
    respond_to do |format|
      format.html # search.html.erb
      format.json { render json: @profile }
    end
  end
  
  def clickout
    profile_id = params[:id]
    url = ProfileUrl.find_by_profile_id(profile_id)
    if !url.nil?
      # First log the click
      click = ClickOut.new
      click.profile_id = profile_id
      click.ip_address = request.remote_ip
      click.click_time = Time.now
      click.save
      
      redirect_to url.url
    end
  end
   
  # GET /profiles/1/details
  # GET /profiles/1/details.json
  def details
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html # details.html.erb
      format.json { render json: @profile }
    end
  end
  
end