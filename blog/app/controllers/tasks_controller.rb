class TasksController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_task, only: [:destroy]

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = "Task created!"
    end
    redirect_to(current_user)
  end

  def update
    
  end

  def destroy
    @task.destroy
    redirect_to current_user
    
  end
 

  def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end

  private
    def set_task
      @task=Task.find(params[:id])
    end
    def task_params
      params.require(:task).permit(:title, :content, :due_date, :priority_id, :tag_id)
    end
end
