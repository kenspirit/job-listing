class JobsController < ApplicationController
  def index
    order_by = params[:order_by]

    case order_by
    when 'by_wage_upper'
      @jobs = Job.published.order("wage_upper DESC")
    when 'by_wage_lower'
      @jobs = Job.published.order("wage_lower DESC")
    else
      @jobs = Job.published.recent
    end
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
