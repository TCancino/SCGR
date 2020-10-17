class JobApplicantsController < ApplicationController
  before_action :set_job_applicant, only: [:show, :edit, :update, :destroy]

  def index
    @job_applicants = JobApplicant.all
  end

  def show
  end

  def new
    @job_applicant = JobApplicant.new
  end

  def edit
  end

  def create
    @job_applicant = JobApplicant.new(job_applicant_params)

    respond_to do |format|
      if @job_applicant.save
        format.html { redirect_to @job_applicant, notice: 'Job applicant was successfully created.' }
        format.json { render :show, status: :created, location: @job_applicant }
      else
        format.html { render :new }
        format.json { render json: @job_applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job_applicant.update(job_applicant_params)
        format.html { redirect_to @job_applicant, notice: 'Job applicant was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_applicant }
      else
        format.html { render :edit }
        format.json { render json: @job_applicant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job_applicant.destroy
    respond_to do |format|
      format.html { redirect_to job_applicants_url, notice: 'Job applicant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_applicant
      @job_applicant = JobApplicant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_applicant_params
      params.require(:job_applicant).permit(:phone, :specialization, :work_experience, :other)
    end
end
