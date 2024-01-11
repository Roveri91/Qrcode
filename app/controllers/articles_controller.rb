class ArticlesController < ApplicationController
  before_action :set_profile

  def new
    @article = @profile.articles.build
  end

  def create
    @article = @profile.articles.build(article_params)
    @article.save

    if @profile.save
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

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :profile)
  end
end
