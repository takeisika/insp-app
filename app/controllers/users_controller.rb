class UsersController < ApplicationController
  before_action:ensure,{only:[:new,:create,:login_form,:login]}
  before_action:ensuring,{only:[:update,:edit]}
  before_action:ensured,{only:[:edit,:update]}


  def index
    @users=User.all
  end

  def new
    @user=User.new
  end


  def show
    @user=User.find_by(id: params[:id])
    @posts=Post.where(user_id: params[:id])
  end

  def create
    @user=User.new(name: params[:username],password: params[:password])
    if @user.save
    session[:user_id]= @user.id
    redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end


  def edit
    @user=User.find_by(id:params[:id])
  end

  def update
    @user=User.find_by(id:params[:id])
    
    if @user.update(user_params)
    flash[:notice]="編集しました"
    redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def login_form
  end

  def login
    @user=User.find_by(name: params[:username],password: params[:password])
    if @user
      session[:user_id] =@user.id
      redirect_to("/follows")
      flash[:notice]="ログインしました"
    else
      flash.now[:notice]="ユーザー名またはパスワードが間違っています"
      @username=params[:username]
      @password=params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id]=nil
    flash[:notice]="ログアウトしました"
    redirect_to("/users/login_form")
  end

  def guest_form
    @user=User.new
  end


  def guest
    if User.find_by(name:"guest")
      @user=User.find_by(name: "guest")
      session[:user_id] =@user.id
      redirect_to("/users/#{@user.id}")
      flash[:notice]="ゲストユーザーとしてログインしました"
    else
      @user=User.new(name: "guest",password: SecureRandom.urlsafe_base64)
      @user.save
      session[:user_id] =@user.id
      redirect_to("/users/#{@user.id}")
      flash[:notice]="ゲストユーザーとしてログインしました"
    end
  end





  private
  def user_params
    params[:user].permit(:name,:avator,:introduction)
  end

  
end
