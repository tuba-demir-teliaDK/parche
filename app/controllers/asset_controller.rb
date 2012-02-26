class AssetController < ApplicationController
   def index
    @user = User.find(params[:user_id])
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user }
    end
  end
end
