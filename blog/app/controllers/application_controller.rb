class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  include SessionsHelper
  def home
    @task = current_user.tasks.build if logged_in?
    @feed_items = current_user.feed.paginate(page: params[:page])
    redirect_to :controller => 'welcome', :action => 'index' 
  end
end
