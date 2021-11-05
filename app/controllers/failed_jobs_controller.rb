class FailedJobsController < ApplicationController
  skip_before_action :authorized
  before_action :set_failed_job, only: [:show, :update, :destroy]

  # GET /failed_jobs
  def index
    @failed_jobs = FailedJob.all

    render json: @failed_jobs
  end

  # GET /failed_jobs/1
  def show
    render json: @failed_job
  end

  # POST /failed_jobs
  def create
    @failed_job = FailedJob.new(failed_job_params)

    DiscordErrorService.new(
      failed_job_params[:name], 
      failed_job_params[:description], 
      failed_job_params[:error], 
      failed_job_params[:stack_trace]
    ).send_error_front  
    
    if @failed_job.save
      render json: @failed_job, status: :created, location: @failed_job
    else
      render json: @failed_job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /failed_jobs/1
  def update
    if @failed_job.update(failed_job_params)
      render json: @failed_job
    else
      render json: @failed_job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /failed_jobs/1
  def destroy
    @failed_job.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_failed_job
      @failed_job = FailedJob.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def failed_job_params
      params.permit(:name, :description, :error, :stack_trace)
    end
end
