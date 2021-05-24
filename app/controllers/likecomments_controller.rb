class LikecommentsController < ApplicationController
  before_action:ensuring,{only:[:destroy]}
  def create
    @comment = Comment.find_by(id: params[:comment_id])
    @post=Post.find_by(id: @comment.post_id)
    @likecomment=Likecomment.new(user_id:@current_user.id,comment_id:params[:comment_id])
    @likecomment.save
    @notification=Notification.new(visitor_id: @current_user.id,visited_id: @comment.user_id,comment_id: @comment.id,action:"likecomment")
    @notification.save
  end

  def destroy
    @comment = Comment.find_by(id: params[:comment_id])
    @post=Post.find_by(id: @comment.post_id)
    @likecomment=Likecomment.find_by(user_id:@current_user.id,comment_id:params[:comment_id])
    if @likecomment
      @likecomment.destroy
    end
  end
end
