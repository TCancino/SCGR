class PostulationsController < ApplicationController
  before_action :set_postulation, only: [:show, :edit, :update, :destroy]

  # GET /postulations
  # GET /postulations.json
  def index
    @postulations = Postulation.all
  end

  # GET /postulations/1
  # GET /postulations/1.json
  def show
    @postulation = Postulation.find(params[:id])
    @aplicant = User.find(@postulation.user_id)
    doc_a = Document.all
    docs = []
    for d in doc_a
      if d.user_id == @postulation.user_id
        docs.append(d)
      end
    end
    doc_post = DocumentPostulation.all
    @documents = []
    @how_many = 0
      for d_p in doc_post
        for d in docs
          if d_p.document_id == d.id
            @documents.append(d)
            @how_many = @how_many + 1
          end
        end
      end
  end

  # GET /postulations/new
  def new
    @postulation = Postulation.new
  end

  # GET /postulations/1/edit
  def edit
  end

  # POST /postulations
  # POST /postulations.json
  def create
    #postulation_params
    @postulation = Postulation.new(postulation_state_id: 1) #1-> No Revisado

    respond_to do |format|
      if @postulation.save
        format.html { redirect_to @postulation, notice: 'Postulation was successfully created.' }
        format.json { render :show, status: :created, location: @postulation }
      else
        format.html { render :new }
        format.json { render json: @postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postulations/1
  # PATCH/PUT /postulations/1.json
  def update
    @post = Post.find(@postulation.post_id)
    respond_to do |format|
      if @postulation.update(postulation_params)
        format.html { redirect_to @post, notice: 'Postulation was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @postulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postulations/1
  # DELETE /postulations/1.json
  def destroy
    @postulation.destroy
    respond_to do |format|
      format.html { redirect_to postulations_url, notice: 'Postulation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postulation
      @postulation = Postulation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def postulation_params
      params.require(:postulation).permit(
        :post_id,
        :postulation_state_id,
        :user_id
      )
    end
end
