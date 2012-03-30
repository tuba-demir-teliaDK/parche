include ApplicationHelper
class VenueCategoriesController < ApplicationController
  # GET /venue_categories
  # GET /venue_categories.json
  def index
    @venue_categories = VenueCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @venue_categories }
    end
  end

  # GET /venue_categories/1
  # GET /venue_categories/1.json
  def show
    @venue_category = VenueCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @venue_category }
    end
  end

  # GET /venue_categories/new
  # GET /venue_categories/new.json
  def new
    @venue_category = VenueCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @venue_category }
    end
  end

  # GET /venue_categories/1/edit
  def edit
    @venue_category = VenueCategory.find(params[:id])
  end

  # POST /venue_categories
  # POST /venue_categories.json
  def create
    @venue_category = VenueCategory.new(params[:venue_category])

    respond_to do |format|
      if @venue_category.save
        format.html { redirect_to @venue_category, notice: 'Venue category was successfully created.' }
        format.json { render json: @venue_category, status: :created, location: @venue_category }
      else
        format.html { render action: "new" }
        format.json { render json: @venue_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /venue_categories/1
  # PUT /venue_categories/1.json
  def update
    @venue_category = VenueCategory.find(params[:id])

    respond_to do |format|
      if @venue_category.update_attributes(params[:venue_category])
        format.html { redirect_to @venue_category, notice: 'Venue category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @venue_category.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_categories
    client.venue_categories.each do |category|
      
      @venue_category =VenueCategory.new
      @venue_category.name=category.name
      @venue_category.fs_category_id=category.id
      @venue_category.status=1
      @venue_category.save
      
      puts category.name
      
      category["categories"].each do |subcategory|
        @venue_subcategory =VenueCategory.new
      
        @venue_subcategory.name=subcategory.name
        @venue_subcategory.fs_category_id=subcategory.id
        @venue_subcategory.status=1
        @venue_subcategory.parent_id=@venue_category.id
        
        @venue_subcategory.save
        
        puts @venue_subcategory.name
      end
    end
    
    
    respond_to do |format|
      format.json { render json: 'categories_array' }
    end
    
  end
  

  # DELETE /venue_categories/1
  # DELETE /venue_categories/1.json
  def destroy
    @venue_category = VenueCategory.find(params[:id])
    @venue_category.destroy

    respond_to do |format|
      format.html { redirect_to venue_categories_url }
      format.json { head :no_content }
    end
  end
end
