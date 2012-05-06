class HomeController < ApplicationController
   
  def index
  end
  
  def now
    respond_to do |format|
      format.json { render json: Time.zone.now.to_s}
    end  
  end

end