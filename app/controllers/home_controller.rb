class HomeController < ApplicationController
  def index
    @total_posts = Post.all.size
    @total_job_applicants = User.where(role: 0).size
    if user_signed_in?
      @total_client_posts = Post.where(user_id: current_user.id).size
    end
  end
end
