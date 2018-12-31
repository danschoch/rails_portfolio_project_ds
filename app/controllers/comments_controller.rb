class CommentsController < ApplicationController
    before_action :require_login

    def index
    end
    
    def new
        @user = current_user
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            redirect_to task_path(comment.task)
        else
            redirect_to task_path(params[:task_id]) #Could do flash message for no comment content
        end
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
