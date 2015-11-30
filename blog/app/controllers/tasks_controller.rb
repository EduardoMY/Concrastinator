class TasksController < ApplicationController

	before_action :logged_in_user, only: [:create, :destroy]
  before_action :set_task, only: [:destroy, :update, :edit, :suggestions]

  def new
    @task = Task.new
  end

  def create
    @task =  current_user.tasks.build(task_params)
 
    respond_to do |format|
      if @task.save
        format.json { head :no_content }
        format.js
      else
        format.json { render json: @task.errors.full_messages, 
                            status: :unprocessable_entity }
      end
      
    end
  end

  def show   
  end

  def suggestions
  end
  
  #def create
  #  @task = current_user.tasks.build(task_params)
  #  if @task.save
  #    flash[:success] = "Task created!"
  #  end
  #  redirect_to(current_user)
  #end

  def edit
  end

  def update
     respond_to do |format|
      if @task.update_attributes(task_params)
        format.json { head :no_content }
        format.js
      else 
         format.json { render json: @customer.errors.full_messages, status: :unprocessable_entity }
      end
    end
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
