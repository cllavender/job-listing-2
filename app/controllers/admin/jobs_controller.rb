class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin

  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path,notice: "Created a new job!"
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path,warning: "Updated a job!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path,alert: "Deleted a job!"
  end

  def require_is_admin
    if !current_user.admin?
      redirect_to jobs_path,alert: "You are not admin"
    end
  end

  private

  def job_params
    params.require(:job).permit(:title,:description)
  end

end
