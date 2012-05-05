class CheckinsController < ApplicationController
  load_and_authorize_resource
  # GET /checkins
  # GET /checkins.json
  def index
    #@checkins = Checkin.all
    
    if params[:user_id] 
      @user= User.find(params[:user_id])
      @checkins = @user.checkins
    end
    
    if params[:item_id] 
      @item= Item.find(params[:item_id])
      @checkins = @item.checkins
    end
    
    if params[:venue_product_id] 
      #@item= Item.find(params[:item_id])
      sql="select c.id, c.created_at, p.first_name, i.price from checkins c, items i, venue_products v, users u,profiles p
        where c.user_id=u.id and p.user_id=u.id and c.item_id=i.id and i.venue_product_id=v.id and venue_product_id = ?"
      @checkins = Checkin.find_by_sql([sql,params[:venue_product_id]])
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
    param=2
    
    if param==1 
      some_objects = []
      query="select "
      #checkin list query="select u.firstname , u.lastName, c.created_at, i.price, v.`fs_venue_id` , p.name from checkins c, items i, venue_products v, products p, users u where c.user_id=u.id and c.item_id=i.id and i.venue_product_id=v.id and v.product_id=p.id and u.id=1"
      mysql_res = ActiveRecord::Base.connection.execute(query)
      
      mysql_res.each do |res| 
        some_objects << res 
      end
      render json: some_objects
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { 
           render json: @checkin.to_json(
           :only=>[:created_at],
           :include=>{
             :item=>{
               :only=>[:price],
               :include=>{:venue_product=>{:only=>[:fs_venue_id]}}},
             :comments=>{
               :only=>[:comments,:created_at],
               :include=>{
                 :user=>{
                   :only=>[:id],
                   :include=>{:profile=>{:only=>[:first_name,:last_name]}}
                 }
               }
             }
           }
          )
        }
      end
    end
  end

  # GET /checkins/new
  # GET /checkins/new.json
  def new
    @checkin = Checkin.new
    @comments=@checkin.comments.build

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
    @checkin.comments.build

    @user = User.find(current_user)
    
    if @checkin.user_id.nil?
      @checkin.user_id=@user.id
    end
    
    @item = Item.find(@checkin.item.id)
    @venue_product=VenueProduct.find(@item.venue_product.id) 
    
    @item.checkin_count= (@item.checkin_count).to_i + 1
    @venue_product.last_checkined_item_id=@item.id
    @venue_product.checkin_count=(@venue_product.checkin_count).to_i + 1
    
    respond_to do |format|
      ActiveRecord::Base.transaction do
        @checkin.save!
        @item.save!
        @venue_product.save!
        format.html { redirect_to @checkin, notice: 'Checkin was successfully created.' }
        format.json { render json: @checkin, status: :created, location: @checkin }
      end      
    end
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotSaved
      format.html { render action: "new" }
      format.json { render json: @checkin.errors, status: :unprocessable_entity }
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
