class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  def index
    #@comments = Comment.all
    p=3
    
    if params[:checkin_id] 
      if p==1
        @checkin= Checkin.find(params[:checkin_id])
        @comments = @checkin.comments
        
        respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @comments.to_json(:only=>[:comments,:created_at],
            :include=>{
              :user=>{
                :only=>[:id],
                :include=>{
                  :profile=>{
                    :only=>[:first_name,:last_name]
                  }
                }
              }
            }
           ) 
          }
        end
      elsif p==2
          some_objects = []
          query="select co.comments, co.created_at, p.first_name,p.last_name from comments co, users u,profiles p where co.user_id=u.id and co.checkin_id=11 and p.user_id=u.id"
          #checkin list query="select u.firstname , u.lastName, c.created_at, i.price, v.`fs_venue_id` , p.name from checkins c, items i, venue_products v, products p, users u where c.user_id=u.id and c.item_id=i.id and i.venue_product_id=v.id and v.product_id=p.id and u.id=1"
          mysql_res = ActiveRecord::Base.connection.execute(query)
          
          mysql_res.each do |res| 
            some_objects << res 
          end
          render json: some_objects
       else
         sql="select co.comments,co.checkin_id,co.user_id, co.created_at, p.first_name,p.last_name from comments co, users u,profiles p 
         where co.user_id=u.id and p.user_id=u.id and co.checkin_id=?"
         @comments = Comment.find_by_sql([sql,params[:checkin_id]])
          respond_to do |format|
            format.html # index.html.erb
            format.json { render json: @comments }
          end
       end
       else
        @comments=Comment.all
        respond_to do |format|
              format.html # index.html.erb
              format.json { render json: @comments }
        end
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id=current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
