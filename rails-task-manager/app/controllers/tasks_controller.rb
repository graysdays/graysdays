class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    puts 'i am about to create a new task'
    @task = Task.new(task_params)
    puts 'i have made a new task object, gonna try save it to the database, fingers crossed'
    @task.save!
    puts 'great, it worked!'
    redirect_to task_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :due_date, :status)
  end
end

