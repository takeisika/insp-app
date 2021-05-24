class LikesController < ApplicationController
  before_action:ensuring,{only:[:destroy]}
  def create
    @post = Post.find_by(id: params[:post_id])
    @like=Like.new(user_id:@current_user.id,post_id:params[:post_id])
    @notification=Notification.new(visitor_id: @current_user.id,visited_id: @post.user_id,post_id: params[:post_id],action:"like")
    @like.save
    @notification.save
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    @like=Like.find_by(user_id:@current_user.id,post_id:params[:post_id])
    if @like
      @like.destroy
    end
  end
end

