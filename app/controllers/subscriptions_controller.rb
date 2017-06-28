class SubscriptionsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @subscriptions = @user.subscriptions
  end
end
