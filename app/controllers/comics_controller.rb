class ComicsController < ApplicationController
  def index
    if params[:user_id].nil?
      @title = "AVAILABLE COMICS"
      @comics = Comic.all
    else
      @user = current_user
      @comics = @user.comics
      @title = "#{@comics.length} CURRENT SUBSCRIPTIONS:"
    end
  end

  def create
    @comic = Comic.new(comic_params)
    if @comic.save
      redirect_to comic_path(@comic)
      flash[:notice]="Successfully added comic"
    else
      flash[:notice] = @comic.errors.full_messages.to_sentence
      render "admin/comics/new"
    end
  end

  def show
    @comic = Comic.find(params[:id])
    @user = current_user
    @subscription = Subscription.find_by(user: @user, comic: @comic)
  end

  def update
    @comic = Comic.find(params[:id])
    if @comic.update_attributes(comic_params)
      flash[:notice] = "Comic Updated"
      redirect_to comic_path(@comic)
    else
      flash[:notice] = @comic.errors.full_messages.to_sentence
      render "admin/comics/edit"
    end
  end

  private

  def comic_params
    params.require(:comic).permit(:publisher, :title, :writer, :artist, :main_character, :other_characters, :photo, :keywords, :ongoing)
  end
end
