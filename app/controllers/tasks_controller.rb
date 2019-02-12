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

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :details))
    @task.save
    redirect_to task_path(@task)
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params.require(:task).permit(:title, :details, :completed))
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path

  end
end
