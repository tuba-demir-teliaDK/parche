class FriendsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    
    respond_to do |format|
      format.html # index.html.erb
      data={"friends"=>@user.friends,"pending_friends"=>@user.pending_friends,"requested_friends"=>@user.requested_friends}
      format.json { render json: data }
    end
  end
  
  def show
    redirect_to user_path(params[:id])
  end
  
  def new
    @friendship1 = Friendship.new
    @friendship2 = Friendship.new
  end
  
  def create
    @user = User.find(current_user)
    @friend = User.find(params[:friend_id])
    params[:friendship1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 0}
    params[:friendship2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 1}
    @friendship1 = Friendship.create(params[:friendship1])
    @friendship2 = Friendship.create(params[:friendship2])
    
    if @friendship1.save && @friendship2.save
        #redirect_to user_friends_path(current_user)
        data = { 'result'=>"A request has been sent to"+ @friend.email }
        render json: data.to_json
    else
       #redirect_to user_path(current_user) 
       data = { 'error'=>"error sending request to "+ @friend.email }
       render json: data.to_json ,:status => 500
    end
  end
  
  def update
    @user = User.find(current_user)
    @friend = User.find(params[:id])
    params[:friendship1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 2}
    params[:friendship2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 2}
    @friendship1 = Friendship.find_by_user_id_and_friend_id(@user.id, @friend.id)
    @friendship2 = Friendship.find_by_user_id_and_friend_id(@friend.id, @user.id)
    if @friendship1.update_attributes(params[:friendship1]) && @friendship2.update_attributes(params[:friendship2])
      flash[:notice] = 'Friend sucessfully accepted!'
      data = { 'result'=>"Friend sucessfully accepted!"}
      render json: data.to_json
      #redirect_to user_friends_path(current_user)
    else
       data = { 'error'=>"error sending request to "+ @friend.email }
       render json: data.to_json ,:status => 500
      #redirect_to user_path(current_user)
    end
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @friend = User.find(params[:id])
    @friendship1 = @user.friendships.find_by_friend_id(params[:id]).destroy
    @friendship2 = @friend.friendships.find_by_user_id(params[:id]).destroy
    #redirect_to user_friends_path(:user_id => current_user)
    data = { 'result'=>"OK" }
    render json: data.to_json    
  end
  
end
