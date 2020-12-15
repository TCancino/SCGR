class UsersController < ApplicationController
  def index
    all_users = User.all
    @users = []
    @roles = []
    @how_many = 0
    for u in all_users
      @users.append(u)
      role = u.role
      if role == 0
        @roles.append('Admin')
      elsif role == 1
        @roles.append('Consultor')
      elsif role == 2
        @roles.append('Cliente')
      else
        @roles.append('Postulante')
      end
      @how_many = @how_many + 1
    end
  end
end
