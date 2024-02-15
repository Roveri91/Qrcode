class CommentsController < ApplicationController
  before_action :set_profile, only: %i[new create]
  before_action :set_article, only: %i[new create]

  def new
    @comment = Comment.new
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

end
