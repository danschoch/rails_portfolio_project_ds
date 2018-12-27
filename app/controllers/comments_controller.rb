class CommentsController < ApplicationController
    before_action :require_login

    def index
    end
    
    def new
        @user = current_user
    end

    def create
        comment = Comment.create(comment_params)
        comment[:task_id] = params[:task_id]
        redirect_to task_path(comment.task)
    end

    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def comment_params
        params.require(:comment).permit(:content, :task_id, :employee_id)
    end

end
