class ArticlesController < ApplicationController
  before_action :set_profile, only: %i[new create show destroy]

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

    # respond_to do |format|
    #   if @article.save
    #     format.turbo_stream { render :create, locals: { article: @article } }
    #   else
    #     format.turbo_stream { render :new, status: :unprocessable_entity, locals: { article: @article } }
    #   end
    # end
  end

  def show
    # @profile = Profile.find(params[:id])
    # @article = @profile.article.find(params[:id])
    @article = Article.find(params[:id])

  end

  def destroy
    @article = Article.find(params[:id])
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

end
