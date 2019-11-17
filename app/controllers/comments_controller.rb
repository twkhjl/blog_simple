class CommentsController < ApplicationController
  
  def create

    @article=Article.find_by(id: params[:article_id])
    
    @comment=@article.comments.new(comment_params)
    @comment.save
    redirect_to article_path(@article),notice:"new comment successfully added"
  end
  
  private
  def comment_params
    params.require(:comment).permit(:commenter,:body)
  end
end
