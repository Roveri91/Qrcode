class CommentsController < ApplicationController
  before_action :set_profile, only: %i[new create]
  before_action :set_article, only: %i[new create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article = @article

    if @comment.save
      redirect_to profile_article_path(@profile, @article)
    else
      render :new
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :profile_id, :article_id)
  end

end
