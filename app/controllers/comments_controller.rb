class CommentsController < ApplicationController
  before_action:check,{only:[:edit,:update,:destroy]}


  def edit
    @comment=Comment.find_by(id: params[:id])
  end

  def update
    @comment=Comment.find_by(id: params[:id])
    @comment.content=params[:commentupdate]
    if @comment.save
      redirect_to("/posts/#{@comment.post_id}/comment")
    end
  end

  def destroy
    @comment=Comment.find_by(id: params[:id])
    @post=Post.find_by(id: @comment.post_id)
    @comment_id=@comment.id
    @comment.destroy
    flash.now[:notice]="削除完了"
  end


  def check
    @comment=Comment.find_by(id:params[:id])
    if @comment.user_id!=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end
end
