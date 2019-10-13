class HomeController < ApplicationController
  def index
    @albums = Album.order(created_at: :desc)
  end
end
