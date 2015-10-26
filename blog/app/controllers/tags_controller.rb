class TagsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

  def create
    @tag = current_user.priorities.build(tag_params)
    if @tag.save
      flash[:success] = "Tag created!"
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

    def tag_params
      params.require(:tag).permit(:title)
    end
end

