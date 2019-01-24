class Employee {
    constructor(firstName, lastName) {
        this.firstName = firstName;
        this.lastName = lastName;
    }
}

Employee.prototype.fullName = function() {
    return `${this.firstName} ${this.lastName}`
}

$(function () {
    if ($('body div.employees.show').length) {
        $.get(window.location.pathname + ".json", (data) => {
            console.log(data);
            showBasicInfo(data);
            showTasks(data);
        });
    
        const showBasicInfo = (data) => {
            const userId = $('.employees.show')[0].dataset.currUserId;
            
            // Greeting Conditional
            (function(data) {
                if (data.id.toString() === userId) {
                    $('#empGreeting').html(`Hi, ${data.first_name}`);
                } else {
                    $('#empGreeting').html(`Info for ${data.first_name + ' ' + data.last_name}`);
                }
            })(data);
            
            $('#empEmail').html(`${data.email}`);
            $('#empTitle').html(`${data.title}`);
            $('#empLead').html(`${data.lead.toString()}`);
        };

        const showTasks = (data) => {
            const tasks = data.tasks

            const taskHTML = (taskData) => {return `
            <li>${taskData.content} - Project: ${taskData.project.name} - ${taskData.due_date}</li>
            `}
            
            tasks.forEach((task) => {
                if (task.completed === true) {
                    $('#empCompletedTasks').append(taskHTML(task));
                } else {
                    $('#empAssignedTasks').append(taskHTML(task));
                }
            });
        };  
    } 
});


