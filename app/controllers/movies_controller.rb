class MoviesController < ApplicationController
  def index
    @movies = Movie.filter(filter_params).page(params[:page]).per(10)
  end

  private

  def filter_params
    params.slice(:actor, :sort_rating)
  end
end
