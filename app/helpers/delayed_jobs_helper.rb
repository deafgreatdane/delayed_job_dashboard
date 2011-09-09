module DelayedJobsHelper
  def display_error(job)
    if (job.last_error.nil?)
      return ""
    end
    lines = job.last_error.split(/\\n/).join("<br>").html_safe

  end
end