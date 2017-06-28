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

  def show
    @comic = Comic.find(params[:id])
    @user = current_user
    @subscription = Subscription.find_by(user: @user, comic: @comic)
  end
end
