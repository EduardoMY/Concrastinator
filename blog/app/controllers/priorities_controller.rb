class PrioritiesController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

  def create
    @priority = current_user.priorities.build(priority_params)
    if @priority.save
      flash[:success] = "Priority created!"
    else
    end
    redirect_to(current_user)
  end
  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end

  def destroy
  end

  private

    def priority_params
      params.require(:priority).permit(:title, :rank)
    end
end
