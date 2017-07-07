class PagesController < ApplicationController
  def home
    @cap_marvel = Comic.find_by(title: "Captain Marvel (2016 - Present)")
    @ironman = Comic.find_by(title: "Iron Man Annual (1970 - 1994)")
    @black_panther = Comic.find_by(title: "Black Panther (2016 - Present)")
    @black_widow = Comic.find_by(title: "Black Widow (2010)")
  end
end
