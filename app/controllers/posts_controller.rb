class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    id = @post.id
    post_state = @post.post_state_id
    @state = PostState.find(post_state)
    postulations = Postulation.all
    @postulations = []
    @users_names = []
    @postulations_states = []
    @how_many = 0
    for postulation in postulations
      if postulation.post_id == id
        @postulations.append(postulation)
        user = User.find(postulation.user_id)
        user_name = user.first_name + " " + user.last_name
        @users_names.append(user_name)
        postulation_state = PostulationState.find(postulation.postulation_state_id)
        @postulations_states.append(postulation_state.name)
        @how_many = @how_many + 1
      end
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    #today = Date.today
    post_name = post_params[:name]
    post_requirements = post_params[:requirements]
    @post = Post.new(name: post_name, requirements: post_requirements, post_state_id: 2) #2-> Abajo

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :requirements)
    end
end
