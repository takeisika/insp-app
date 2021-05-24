class FollowsController < ApplicationController
  before_action:ensuring


  def create
    @user=User.find_by(id: params[:user_id])
    @follow=Follow.new(following_id: @current_user.id,followed_id: params[:user_id])
    @notification=Notification.new(visitor_id: @current_user.id,visited_id: params[:user_id],action:"follow")
    if @follow.save
      flash.now[:notice]="フォローしました"
    end
    @notification.save
  end


  def destroy
    @user=User.find_by(id: params[:user_id])
    @follow=Follow.find_by(following_id: @current_user.id,followed_id: params[:user_id])
    if @follow.destroy
      flash.now[:notice]="フォローを外しました"
    end
  end
 
end
