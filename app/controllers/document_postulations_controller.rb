class DocumentPostulationsController < ApplicationController
  before_action :set_document_postulation, only: [:show, :edit, :update, :destroy]

  # GET /document_postulations
  # GET /document_postulations.json
  def index
    @document_postulations = DocumentPostulation.all
  end

  # GET /document_postulations/1
  # GET /document_postulations/1.json
  def show
  end

  # GET /document_postulations/new
  def new
    @document_postulation = DocumentPostulation.new
  end

  # GET /document_postulations/1/edit
  def edit
  end

  # POST /document_postulations
  # POST /document_postulations.json
  def create
    @document_postulation = DocumentPostulation.new(document_postulation_params)

    respond_to do |format|
      if @document_postulation.save
        format.html { redirect_to @document_postulation, notice: 'Document postulation was successfully created.' }
        format.json { render :show, status: :created, location: @document_postulation }
      else
        format.html { render :new }
        format.json { render json: @document_postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /document_postulations/1
  # PATCH/PUT /document_postulations/1.json
  def update
    respond_to do |format|
      if @document_postulation.update(document_postulation_params)
        format.html { redirect_to @document_postulation, notice: 'Document postulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @document_postulation }
      else
        format.html { render :edit }
        format.json { render json: @document_postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /document_postulations/1
  # DELETE /document_postulations/1.json
  def destroy
    @document_postulation.destroy
    respond_to do |format|
      format.html { redirect_to document_postulations_url, notice: 'Document postulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document_postulation
      @document_postulation = DocumentPostulation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_postulation_params
      params.fetch(:document_postulation, {})
    end
end
