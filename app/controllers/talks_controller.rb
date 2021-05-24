class TalksController < ApplicationController
  before_action:ensuring
  before_action:talk_ensure

  def new
    @talk=Talk.new
  end

  def show
    @talk=Talk.new
    @user=User.find_by(id:params[:id])
  end


  def create
    @talk=Talk.new(talk_params)
    @user=User.find_by(id: @talk.your_id)
    if @talk.save
      flash[:notice]="送信しました"
      redirect_to("/talks/#{@talk.your_id}")
    end
  end


  def talk_ensure
    if @current_user.id==params[:id].to_i
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end


  private
  def talk_params
    params.require(:talk).permit(:content,:your_id,:my_id,:chatfile)
  end

end
