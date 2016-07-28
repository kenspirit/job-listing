class JobsController < ApplicationController
  def index
    @jobs = Job.where(:is_hidden => false).order("created_at DESC")
  end

  def show
    @job = Job.find(params[:id])

    if @job.hidden?
      flash[:warning] = "This Job already archieved"
      redirect_to root_path
      return
    end

    render :show
  end
end
