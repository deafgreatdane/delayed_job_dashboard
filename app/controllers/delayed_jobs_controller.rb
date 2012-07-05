class DelayedJobsController < ActionController::Base

  def index
  end

  def show
    begin
      @job = Delayed::Job.find(params[:id])
      render :layout =>nil
    rescue ActiveRecord::RecordNotFound => rnf
      render :text => "Not found, maybe it finished?"
    end
  end
  def counts
    @wip_counts     = wip_jobs.count
    @failing_counts = failing_jobs.count
    @overdue_counts = overdue_jobs.count
    @future_counts  = future_jobs.count
  end

  def wip
    @jobs = wip_jobs
    render :layout =>nil
  end
  def failing
    @jobs = failing_jobs
    render :layout =>nil
  end
  def overdue
    @jobs = overdue_jobs
    render :layout =>nil
  end
  def future
    @jobs = future_jobs
    render :layout =>nil
  end

  private

  def wip_jobs
    Delayed::Job.
      where("locked_by is not null").
      where("attempts < ?", Delayed::Worker.max_attempts)
  end
  def failing_jobs
    Delayed::Job.
      where("attempts >= 1").
      where("failed_at is not null")
  end
  def overdue_jobs
    Delayed::Job.
      where("run_at < ?", Time.now).
      where("locked_by is null").
      where("failed_at is null")
  end
  def future_jobs
    Delayed::Job.
      where("run_at >= ?", Time.now)
  end
end
