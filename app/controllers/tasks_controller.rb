class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save!
      redirect_to task_path(@task)
    else
      redirect_to task_new_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    head :no_content  # 204, Turbo ne navigue pas, pas de reload
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  def show
    @task = Task.find(params[:id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

end
