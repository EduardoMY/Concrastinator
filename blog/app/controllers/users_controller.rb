class UsersController < ApplicationController
  
  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])

      if session[:user_id]!=@user.id
        root :to => "welcome#index"
      else
        @tasks = @user.tasks.paginate(page: params[:page])
      end
    else redirect_to :controller => 'welcome', :action => 'index' 
    end
    
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
end
