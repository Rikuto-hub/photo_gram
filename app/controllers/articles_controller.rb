class ArticlesController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  def index
    if user_signed_in?
      user_ids = current_user.followings.pluck(:id)
      @articles = Article.where(user_id: user_ids)
    else
      @articles = Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: '保存完了'
    else
      flash.now[:error] = ' 保存に失敗しました'
      render :new
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private
  def article_params
    params.require(:article).permit(:content, :tag, :img)
  end
end