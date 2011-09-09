class DelayedJobsController < ActionController::Base

  def index
  end

  def show
    begin
      @job = Delayed::Job.find(params[:id])
      render :layout =>nil
    rescue ActiveRecord::RecordNotFound => rnf
      render :text =>"Not found, maybe it finished?"
      return

    #handle Exception => e
    #  puts e
    #rescue
    #  #  render :text =>"Not found, maybe it finished?"
    #  #  return
    end
  end
  def counts
    @wip_counts = Delayed::Job.where("locked_by is not null").length
    @failing_counts = Delayed::Job.where("attempts > 1").length
    @overdue_counts = Delayed::Job.where("run_at < ?", Time.now).length
    @future_counts = Delayed::Job.where("run_at >= ?", Time.now).length
  end

  def wip
    @jobs = Delayed::Job.where("locked_by is not null")
    render :layout =>nil
  end
  def failing
    @jobs = Delayed::Job.where("attempts > 1")
    render :layout =>nil

  end
  def overdue
    @jobs = Delayed::Job.where("run_at < ?", Time.now)
    render :layout =>nil
  end
  def future
    @jobs = Delayed::Job.where("run_at >= ?", Time.now)
    render :layout =>nil

  end
end