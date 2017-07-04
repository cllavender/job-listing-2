class ResumesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @resumes = Resume.all
  end

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    @resume.job = @job

    if @resume.save
      redirect_to job_path(@job),notice:"#{current_user.email} submit resume to #{@job.title}"
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end

end
