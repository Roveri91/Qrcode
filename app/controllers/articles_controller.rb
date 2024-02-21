class ArticlesController < ApplicationController
  before_action :set_profile, only: %i[new create show destroy]
  before_action :set_article, only: %i[show destroy]

  def new
    # @profile = Profile.find(params[:profile_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.profile = @profile


    if @article.save
      redirect_to profile_article_path(@profile, @article)
    else
      render :new
    end

  end

  def show

  end

  def destroy
    @article.destroy

    redirect_to profile_path(@profile), status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
