class CheckinsController < ApplicationController
  load_and_authorize_resource
  # GET /checkins
  # GET /checkins.json
  def index
    @checkins = Checkin.all
    
    if params[:user_id] 
      @user= User.find(params[:user_id])
      @checkins = @user.checkins
    end
    
    if params[:item_id] 
      @item= Item.find(params[:item_id])
      @checkins = @item.checkins
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @checkins }
    end
  end

  # GET /checkins/1
  # GET /checkins/1.json
  def show
    @checkin = Checkin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @checkin }
    end
  end

  # GET /checkins/new
  # GET /checkins/new.json
  def new
    @checkin = Checkin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @checkin }
    end
  end

  # GET /checkins/1/edit
  def edit
    @checkin = Checkin.find(params[:id])
  end

  # POST /checkins
  # POST /checkins.json
  def create
    @checkin = Checkin.new(params[:checkin])
    
    @item = Item.find(@checkin.item.id)
    
    if @item 
      Item.increment_counter(:checkin_count,@item.id)
      @venue_product=VenueProduct.find(@item.venue_product.id)
      #VenueProduct.increment_counter(:checkin_count,@item.venue_product.id)
      @venue_product.update_attributes(:last_checkined_item_id=>@item.id,:checkin_count=>(@venue_product.checkin_count).to_i + 1)
    end

    respond_to do |format|
      if @checkin.save
        format.html { redirect_to @checkin, notice: 'Checkin was successfully created.' }
        format.json { render json: @checkin, status: :created, location: @checkin }
      else
        format.html { render action: "new" }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /checkins/1
  # PUT /checkins/1.json
  def update
    @checkin = Checkin.find(params[:id])

    respond_to do |format|
      if @checkin.update_attributes(params[:checkin])
        format.html { redirect_to @checkin, notice: 'Checkin was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /checkins/1
  # DELETE /checkins/1.json
  def destroy
    @checkin = Checkin.find(params[:id])
    @checkin.destroy

    respond_to do |format|
      format.html { redirect_to checkins_url }
      format.json { head :ok }
      format.js   { render :nothing => true } 
    end
  end
end
