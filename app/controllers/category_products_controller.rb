class CategoryProductsController < ApplicationController
  # GET /category_products
  # GET /category_products.json
  def index
    @category_products = CategoryProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @category_products }
    end
  end

  # GET /category_products/1
  # GET /category_products/1.json
  def show
    @category_product = CategoryProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category_product }
    end
  end

  # GET /category_products/new
  # GET /category_products/new.json
  def new
    @category_product = CategoryProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category_product }
    end
  end

  # GET /category_products/1/edit
  def edit
    @category_product = CategoryProduct.find(params[:id])
  end

  # POST /category_products
  # POST /category_products.json
  def create
    @category_product = CategoryProduct.new(params[:category_product])

    respond_to do |format|
      if @category_product.save
        format.html { redirect_to @category_product, notice: 'Category product was successfully created.' }
        format.json { render json: @category_product, status: :created, location: @category_product }
      else
        format.html { render action: "new" }
        format.json { render json: @category_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /category_products/1
  # PUT /category_products/1.json
  def update
    @category_product = CategoryProduct.find(params[:id])

    respond_to do |format|
      if @category_product.update_attributes(params[:category_product])
        format.html { redirect_to @category_product, notice: 'Category product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_products/1
  # DELETE /category_products/1.json
  def destroy
    @category_product = CategoryProduct.find(params[:id])
    @category_product.destroy

    respond_to do |format|
      format.html { redirect_to category_products_url }
      format.json { head :no_content }
    end
  end
end
