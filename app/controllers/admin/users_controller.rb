class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.admin?
      @user.destroy
      flash[:notice] = "User account deleted"
      redirect_to admin_users_path
    end
  end
end
