class UserFollowupsController < ApplicationController
  # GET /user_followups
  # GET /user_followups.json
  def index
    @user_followups = UserFollowup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_followups }
    end
  end

  # GET /user_followups/1
  # GET /user_followups/1.json
  def show
    @user_followup = UserFollowup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_followup }
    end
  end

  # GET /user_followups/new
  # GET /user_followups/new.json
  def new
    @user_followup = UserFollowup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_followup }
    end
  end

  # GET /user_followups/1/edit
  def edit
    @user_followup = UserFollowup.find(params[:id])
  end

  # POST /user_followups
  # POST /user_followups.json
  def create
    @user_followup = UserFollowup.new(params[:user_followup])

    respond_to do |format|
      if @user_followup.save
        format.html { redirect_to @user_followup, notice: 'User followup was successfully created.' }
        format.json { render json: @user_followup, status: :created, location: @user_followup }
      else
        format.html { render action: "new" }
        format.json { render json: @user_followup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_followups/1
  # PUT /user_followups/1.json
  def update
    @user_followup = UserFollowup.find(params[:id])

    respond_to do |format|
      if @user_followup.update_attributes(params[:user_followup])
        format.html { redirect_to @user_followup, notice: 'User followup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_followup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_followups/1
  # DELETE /user_followups/1.json
  def destroy
    @user_followup = UserFollowup.find(params[:id])
    @user_followup.destroy

    respond_to do |format|
      format.html { redirect_to user_followups_url }
      format.json { head :no_content }
    end
  end
end
