class JobApplicantsController < ApplicationController
  before_action :set_job_applicant, only: [:show, :edit, :update, :destroy]

  # GET /job_applicants
  # GET /job_applicants.json
  def index
    @job_applicants = JobApplicant.all
  end

  # GET /job_applicants/1
  # GET /job_applicants/1.json
  def show
  end

  # GET /job_applicants/new
  def new
    @job_applicant = JobApplicant.new
  end

  # GET /job_applicants/1/edit
  def edit
  end

  # POST /job_applicants
  # POST /job_applicants.json
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

  # PATCH/PUT /job_applicants/1
  # PATCH/PUT /job_applicants/1.json
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

  # DELETE /job_applicants/1
  # DELETE /job_applicants/1.json
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
