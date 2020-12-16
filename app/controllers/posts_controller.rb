class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
    @post = []
    @post_state = []
    @how_many = 0
    for i in @posts
      @post.append(i)
      @post_state.append(PostState.find(i.post_state_id))
      @how_many = @how_many + 1
    end
    users = User.all
    @clients = []
    for user in users
      if user.role == 2
        @clients.append(user)
      end
    end
  end

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

  def new
    @post = Post.new
    users = User.all
    @clients = []
    for user in users
      if user.role == 2
        @clients.append(user)
      end
    end
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
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

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(
        :name,
        :requirements,
        :id,
        :post_state_id,
        :vacancies,
        :user_id
      )
    end
end
