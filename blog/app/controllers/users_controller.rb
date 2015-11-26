class UsersController < ApplicationController
  
  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])

      if session[:user_id]!=@user.id
        redirect_to :controller => 'welcome', :action => 'index' 
      elsif params[:q]
        @tasksA= @user.tasks.paginate(page: params[:page]).search(params[:q]).where('due_date > ?', Time.now.to_formatted_s(:db))
        @tasksP= nil
      else
        @tasksA = @user.tasks.all.paginate(page: params[:page]).where('due_date > ?', Time.now.to_formatted_s(:db))
        @tasksP = @user.tasks.all.paginate(page: params[:page]).where('due_date < ?', Time.now.to_formatted_s(:db))
      end
    else redirect_to :controller => 'welcome', :action => 'index' 
    end
    
  end
  
  def index
    return show
  end

  
  def new
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the Sample App!"
        @tag = Tag.new(:title => "Assignment", :user_id => @user.id)
        @tag.save
        @priority = Priority.new(:title => "Normal", :rank => "3", :user_id => @user.id)
        @priority.save
        redirect_to @user
      else
        render 'new'
      end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
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
