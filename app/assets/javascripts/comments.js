class Comment {
    constructor(content, employee, task) {
        this.content = content;
        this.employee = employee;
        this.task = task;
    } 
}

$(function () {
    if ($('body div.tasks.show').length) {
        //Event Listener for new comment submission
        $('#new_comment').submit(function(event) {
            event.preventDefault();
    
            const values = $(this).serialize();
    
            const commenting = $.post("/comments.json", values);
    
            commenting.done(function() {
                clearComments();
                showComments();

                //Clear new comment form text box and reactivate submit button
                $("#comment_content").val('');
                $("input[type=submit]").removeAttr("disabled");
            });
        });
        
        //Function Declaration to display comments (using JS model objects)
        const showComments = () => {
            const taskId = $('.tasks.show')[0].dataset.id;

            $.get("/comments.json",{task_id: taskId}, function(data) {
                data.forEach(comment => {
                    let newEmployee = new Employee(comment.employee.first_name, comment.employee.last_name, comment.task);
                    let newComment = new Comment(comment.content, comment.employee, comment.task);
                
                    $("#commentList").append(
                    `<li>${newComment.content}<br>
                    Posted By: ${newEmployee.fullName()}</li>`
                    );
        
                });
            });
        }
    
        //Function Declartion to clear comments (used after new comment submit before showing all comments again)
        const clearComments = () => {
            $("#commentList").empty();
        }
    
        //Initial call to show current comments on document(ready)
        showComments();
    } 
});
