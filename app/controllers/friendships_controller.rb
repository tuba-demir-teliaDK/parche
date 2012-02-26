class FriendshipsController < ApplicationController
  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
    
    if params[:user_id] 
      @user= User.find(params[:user_id])
      @friendships = @user.friends
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friendships }
    end
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friendship }
    end
  end

  # GET /friendships/new
  # GET /friendships/new.json
  def new
    @friendship = Friendship.new
    @friendship2 = Friendship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @friendship }
    end
  end

  # GET /friendships/1/edit
  def edit
    @friendship = Friendship.find(params[:id])
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @user = User.find(1)
    @friend = User.find(params[:friend_id])
    params[:friendship1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 'requested'}
    params[:friendship2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'pending'}
    @friendship1 = Friendship.create(params[:friendship1])
    @friendship2 = Friendship.create(params[:friendship2])

    respond_to do |format|
      if @friendship.save && @friendship2.save
        format.html { redirect_to @friendship, notice: 'Friendship was successfully created.' }
        format.json { render json: @friendship, status: :created, location: @friendship }
      else
        format.html { render action: "new" }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /friendships/1
  # PUT /friendships/1.json
  def update
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      if @friendship.update_attributes(params[:friendship])
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to friendships_url }
      format.json { head :ok }
    end
  end

end
