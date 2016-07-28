class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"
  
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def show
    @job = Job.find(params[:id])

    render :edit
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to admin_jobs_path
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "修改成功！"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])

    @job.destroy
    redirect_to admin_jobs_path, alert: "已刪除"
  end

  def publish
    @job = Job.find(params[:id])
    @job.publish!
    redirect_to :back
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!
    redirect_to :back
  end

  private 

  def job_params
    params.require(:job).permit(:title, :description, :wage_lower, :wage_upper, :contact, :is_hidden)
  end
end
