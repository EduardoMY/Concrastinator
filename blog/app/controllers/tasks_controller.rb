class TasksController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "Task created!"
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

    def task_params
      params.require(:task).permit(:title, :content, :tag_id, :priority_id, :due_date)
    end
end
