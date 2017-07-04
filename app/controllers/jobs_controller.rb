class JobsController < ApplicationController

  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              Job.published.order("wage_lower_bound DESC")
            when 'by_upper_bound'
              Job.published.order("wage_upper_bound DESC")
            else
              Job.published.recent
            end
  end

  def show
    @job = Job.find(params[:id])

    if @job.hidden?
      flash[:warning] = "This Job already archived"
      redirect_to root_path
    end
  end

end
