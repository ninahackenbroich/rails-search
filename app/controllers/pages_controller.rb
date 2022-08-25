class PagesController < ApplicationController
  def home
    PgSearch::Multisearch.rebuild(Movie)
    PgSearch::Multisearch.rebuild(TvShow)
    @results = PgSearch.multisearch(params[:query])
  end
end
