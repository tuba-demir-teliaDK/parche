class VenueProductsController < ApplicationController
  # GET /venue_products
  # GET /venue_products.json
  def index
    
    if !params[:fs_venue_id].nil?
      @venue_products = VenueProduct.where("fs_venue_id = ?", params[:fs_venue_id])
    else
      @venue_products = VenueProduct.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venue_products }
    end
  end

  # GET /venue_products/1
  # GET /venue_products/1.json
  def show
    @venue_product = VenueProduct.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue_product }
    end
  end

  # GET /venue_products/new
  # GET /venue_products/new.json
  def new
    @venue_product = VenueProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue_product }
    end
  end

  # GET /venue_products/1/edit
  def edit
    @venue_product = VenueProduct.find(params[:id])
  end

  # POST /venue_products
  # POST /venue_products.json
  def create
    @venue_product = VenueProduct.new(params[:venue_product])
    @venue = Venue.find_by_fs_venue_id(@venue_product.fs_venue_id)
    @venue.product_count=(@venue.product_count).to_i + 1
    #@venue.update_attribute(:product_count,(@venue.product_count).to_i + 1)

    respond_to do |format|
      if @venue_product.save && @venue.save
        
        format.html { redirect_to @venue_product, notice: 'Venue product was successfully created.' }
        format.json { render json: @venue_product, status: :created, location: @venue_product }
      else
        format.html { render action: "new" }
        format.json { render json: @venue_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /venue_products/1
  # PUT /venue_products/1.json
  def update
    @venue_product = VenueProduct.find(params[:id])

    respond_to do |format|
      if @venue_product.update_attributes(params[:venue_product])
        format.html { redirect_to @venue_product, notice: 'Venue product was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venue_products/1
  # DELETE /venue_products/1.json
  def destroy
    @venue_product = VenueProduct.find(params[:id])
    @venue_product.destroy
    
    @venue = Venue.find_by_fs_venue_id(@venue_product.fs_venue_id)
    @venue.update_attribute(:product_count,(@venue.product_count).to_i - 1)

    respond_to do |format|
      format.html { redirect_to venue_products_url }
      format.json { head :ok }
    end
  end

  
  def vplist
    
    if !params[:fs_venue_id].nil?
      @venue_products= VenueProduct.all(:include=> :product, :conditions=> {:fs_venue_id => params[:fs_venue_id]})
    elsif !params[:id].nil?
      #@product= Product.find(VenueProduct.find(params[:id]).product.id)
      @venue_products= VenueProduct.all(:include=> :product, :conditions=> {:products=> {:id => params[:id]}})
      #@venue_products= VenueProduct.find(:all,)
    end
    
    respond_to do |format|
      format.html # vpl_by_parameter.html.erb
      if !params[:id].nil?
        #format.json{render :json =>vplist_as_json(@venue_products,'v')} 
        
        format.json { 
          render :json => @venue_products.to_json(:include => {
              :most_checkined_item => {:only => [:price , :id] },
              :last_checkined_item => {:only => [:price , :id] },
              :verified_item => {:only => [:price , :id] },              
            },
            :methods => :venue_name,
            :except => [:most_checkined_item_id, :last_checkined_item_id, :verified_item_id]
            ) 
        }
      elsif !params[:fs_venue_id].nil?
          @vName=@venue_products.first.venue_name
          format.json { 
          render :json => @venue_products.to_json(:include => {
            :product => {:only => [:id, :name]},
            :most_checkined_item => {:only => [:price , :id] },
            :last_checkined_item => {:only => [:price , :id] },
            :verified_item => {:only => [:price , :id] },              
            }, :except => [:product_id,:most_checkined_item_id, :last_checkined_item_id, :verified_item_id]
            ) 
        }
      end
    end
  end
end
