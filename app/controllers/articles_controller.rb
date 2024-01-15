class ArticlesController < ApplicationController


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.profile = @profile
    @article.save

    if @article.save
      redirect_to profile_path(@profile)
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

  private



  def article_params
    params.require(:article).permit(:title, :content, :profile)
  end
end
