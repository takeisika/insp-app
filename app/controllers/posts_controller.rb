class PostsController < ApplicationController
  before_action:ensuring
  before_action:postensure,{only:[:edit,:update,:destroy]}

  def index
    @tasks=Task.all
  end

  def _form
    @task=Task.new
  end

  def create
    @task=Task.new(content: params[:task], phrase: params[:phrase],user_id:@current_user.id)
    if @task.save
      redirect_to("/posts/index")
    else
      render("posts/_form")
    end
  end

  def show
    @task=Task.find_by(id: params[:id])
  end

  def edit
    @task=Task.find_by(id: params[:id])
  end

  def update
    @task=Task.find_by(id: params[:id])
    @task.content=params[:update]
    @task.phrase=params[:updatestatus]
    if @task.save
    flash[:notice]="編集完了"
    redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @task=Task.find_by(id: params[:id])
    @task.destroy
    flash[:notice]="削除完了"
    redirect_to("/posts/index")
  end

  def postensure
    @task=Task.find_by(id:params[:id])
    if @task.user_id!=@current_user.id
      flash[:notice]="権限がありません"
      redirect_to("/posts/index")
    end
  end
end
