class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = User.all
    @user = current_user
  end

  def show
    #@document = Document.find(params[:id])
    render 'documents/show'
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    doc_name = document_params[:name]
    doc_file = document_params[:link]
    @document = Document.new(name: doc_name, link: doc_file, user_id: current_user.id)

    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.purge_later
    respond_to do |format|
      format.html { redirect_to documents_path, notice: 'Documento eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = ActiveStorage::Blob.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def document_params
      params.require(:document).permit(:id)
    end
end
