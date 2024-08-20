class TasksController < ApplicationController
  def index
    # @submissions = Submission.all

    if params[:all_users] == "true"
      @user_tasks = Task.where(user: current_user.household.users)
      @user = nil
    elsif params[:user_id].present?
      @user = User.find(params[:user_id])
      @user_tasks = Task.where(user: @user)
    else
      @user = current_user
      @user_tasks = Task.where(user: @user)
    end
    house = current_user.household
    @users = house.users

  end

  def show
  end

  def new
    @task =  Task.new
  end

  def create
    @task = Task.new(task_params)
    @user = current_user
    @task.user = @user
    @task.household = @user.household

    if @task.save
      redirect_to tasks_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :frequency, :category)
  end

end