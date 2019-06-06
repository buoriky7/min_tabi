class ArticlesController < ApplicationController
  def new
  	@article = Article.new
  end

  def edit
  end

  private
  def article_params
  	params.require(:article).permit(:article_image, :caption, :body, )
  end
end
