module JobsHelper

  def render_job_status(job)
    if job.hidden?
      "(Hidden)"
    else
      "(Public)"
    end
  end
end
