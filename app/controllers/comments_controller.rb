class CommentsController < ApplicationController
  before_action :require_user

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @comment = @recipe.comments.build(comment_params)
    @comment.chef = current_chef
    if @comment.save
      flash[:sucess] = "Comment was created sucessfully"
      redirect_to recipe_path(@recipe)
    else
      flash[:danger] = "Comment was not created"
      redirect_to :Back
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description)
  end

end
