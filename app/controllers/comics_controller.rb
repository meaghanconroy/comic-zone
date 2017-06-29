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
    if comic_params[:creators]
      @creators = comic_params[:creators].split(';')
    end
    if comic_params[:characters]
      @characters = comic_params[:characters].split(';')
    end
    if comic_params[:keywords]
      @keywords = comic_params[:keywords].split(';')
    end
    @comic = Comic.new(publisher: comic_params[:publisher], title: comic_params[:title], creators: @creators, characters: @characters, photo: comic_params[:photo], keywords: @keywords)
    if @comic.save
      redirect_to comics_path
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

  private

  def comic_params
    params.require(:comic).permit(:publisher, :title, :creators, :characters, :photo, :keywords)
  end
end
