class LikesController < ApplicationController
    def create
      @like = current_user.likes.create(ashop_id: params[:ashop_id])
      redirect_back(fallback_location: root_path)
    end
  
    def destroy
      @like = Like.find_by(post_id: params[:ashop_id], user_id: current_user.id)
      @like.destroy
      redirect_back(fallback_location: root_path)
    end
  end