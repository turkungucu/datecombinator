class DbqueryController < ApplicationController
  layout "account"
  before_filter :authenticate_admin!
  
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end
  
  def show
    conn = ActiveRecord::Base.connection()
    begin
      @result = conn.execute(params[:query])
    rescue => e
      @error_msg = e.message    
    end
    
    render :action => 'index'
  end
end