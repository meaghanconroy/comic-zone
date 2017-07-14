class SubscriptionsController < ApplicationController
  def index
    @user = current_user
    @comics = @user.comics
    @title = "#{@comics.length} CURRENT SUBSCRIPTION(S):"
  end
  def new
    @subscription = Subscription.new
    @comic = Comic.find(params[:comic_id])
  end
  def create
    @comic = Comic.find(params[:comic_id])
    @subscription = Subscription.create(user: current_user, comic: @comic)
    redirect_to user_subscriptions_path(current_user)
  end
  def destroy
    @comic = Comic.find(params[:comic_id])
    @user = current_user
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_to user_path(@user)
    flash[:notice] = "Subscription ended"
  end
end
