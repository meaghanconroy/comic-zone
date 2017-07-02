class Admin::ComicsController < ApplicationController
  def new
    @comic = Comic.new
  end
  def edit
    @comic = Comic.find(params[:id])
  end
  def destroy
    if current_user.admin?
      @comic = Comic.find(params[:id])
      @comic.destroy
      redirect_to comics_path
      flash[:notice] = "Successfully deleted comic"
    end
  end
end
