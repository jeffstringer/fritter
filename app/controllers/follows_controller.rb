class FollowsController < ApplicationController

  def index
    @follows = Follow.all

    respond_to do |format|
      format.json { render :json => @follows }
    end
  end

  def create
    @user = User.find(params["user_id"])
    @following = @user.followers.new(follower_id: current_user.id)

    if @following.save
      respond_to do |format|
        format.html do
          redirect_to root_path
        end
        format.json { render :json => @following, :status => 201 }
      end
    end
  end

end
