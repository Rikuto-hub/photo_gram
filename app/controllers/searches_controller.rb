class SearchesController < ApplicationController
  def index
    @articles = Article.search(params[:search])
    render 'articles/index'
  end
end