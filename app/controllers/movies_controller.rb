class MoviesController < ApplicationController
  def index
    if params[:query].present?
      # @movies = Movie.where(title: params[:query])
      # sql = "movies.title @@ :query OR movies.synopsis @@ :query OR directors.first_name @@ :query OR directors.last_name @@ :query"
      # @movies = Movie.joins(:director).where(sql, query: "%#{params[:query]}%")
      @movies = Movie.search_by_title_and_synopsis(params[:query])
    else
      @movies = Movie.all
    end
  end
end
