class UsersController < ApplicationController
  def index
    all_users = User.all
    @users = []
    @roles = []
    @how_many = 0
    for u in all_users
      @users.append(u)
      role = u.role
      if role == 3
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

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def set_post
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :id,
      :first_name,
      :last_name,
      :rut,
      :dv,
      :role
    )
  end
end
