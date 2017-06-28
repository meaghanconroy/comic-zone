class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
    @comic = Comic.find(params[:comic_id])
  end
  def create
    # binding.pry
    @comic = Comic.find(params[:comic_id])
    @subscription = Subscription.create(user: current_user, comic: @comic)
    redirect_to user_path(current_user)
  end
end
