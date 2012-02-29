class VenueProductsController < ApplicationController
  # GET /venue_products
  # GET /venue_products.json
  def index
    
    if !params[:venue_id].nil?
      @venue_products = VenueProduct.where("venue_id = ?", params[:venue_id])
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

    respond_to do |format|
      if @venue_product.save
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

    respond_to do |format|
      format.html { redirect_to venue_products_url }
      format.json { head :ok }
    end
  end

  
  def ovenues
    if !params[:venue_id].nil?
      #@venue= Venue.find(params[:venue_id])
      @venue_products= VenueProduct.by_venue(params[:venue_id])
    elsif !params[:id].nil?
      @product= Product.find(VenueProduct.find(params[:id]).product.id)
      @venue_products= VenueProduct.by_product(@product)
    end
    
    respond_to do |format|
      format.html # ovenues.html.erb
      format.json { render json: @venue_products }
    end
  end
end
