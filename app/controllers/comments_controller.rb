# frozen_string_literal: true

class CommentsController < ApplicationController
  helper_method :project

  def create
    @comment = project.comments.build(comment_params) do |comment|
      comment.user = current_user
    end

    if @comment.save
      respond_to do |format|
        format.html { redirect_back_or_to project_path(project), notice: "Comment was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Comment was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project
    @project ||= Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
