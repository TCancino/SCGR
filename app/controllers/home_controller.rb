class HomeController < ApplicationController
  def index
    @total_posts = Post.all.size
    @total_job_applicants = User.where(role: 0).size
  end
end
