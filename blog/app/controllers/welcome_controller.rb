class WelcomeController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def home

  end

  def lobby
    render text: "Hello~! controllers/welcome_controller"
  end

  def index
 	#redirect_to "welcome/activity"
     if current_user
      redirect_to user_path(current_user)
    end
  end

  def activity
	
  end
end
