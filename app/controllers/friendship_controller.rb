class FriendshipController < ApplicationController
  before_filter  :setup_friends
# Send a friend request.
# We'd rather call this "request", but that's not allowed by Rails.
  def index
    redirect_to @user
  end
  def create
    Friendship.request(@user, @friend)
    flash[:notice] = "Friend request sent."
    redirect_to @friend
  end
  def accept_friendship
    Friendship.accept(@user,@friend)
    redirect_to @user
  end

  def accept
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "Friendship with "+@friend.firstname+" accepted!"
    else
      flash[:notice] = "No friendship request from "+@friend.firstname+" ."
    end
    redirect_to profile_path
  end
  def decline
    if @user.requested_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with "+@friend.firstname+" declined"
    else
      flash[:notice] = "No friendship request from "+@friend.firstname+"."
    end
    redirect_to profile_path
  end
  def cancel
    if @user.pending_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship request canceled."
    else
      flash[:notice] = "No request for friendship with"+@friend.firstname
    end
    redirect_to profile_path
  end
  def delete
    if @user.friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with "+@friend.firstname+" deleted!"
    else
      flash[:notice] = "You aren't friends with "+@friend.firstname
    end
      redirect_to profile_path
  end
  private
  def setup_friends
    @user = current_user
    @friend = User.find_by_id(params[:id])
  end
end