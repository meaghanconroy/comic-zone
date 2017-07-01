class Api::V1::ComicsController < ApplicationController
  def index
    render json: { comics: Comic.all }
  end
end
