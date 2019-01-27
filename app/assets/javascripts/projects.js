class Project {
    constructor(name, id) {
        this.name = name;
        this.id = id
    }
}

$(function () {
    if ($('main.projects.index').length) {
        const showProjects = () => {
            let organizationId = $('.projects.index')[0].dataset.organizationId;

            $.get("/projects.json",{organization_id: organizationId}, function(data) {
                data.forEach(project => {
                    let newProject = new Project(project.name, project.id);
                
                    $("#projectList").append($(`<li><a href="/projects/${project.id}">${newProject.name}</a></li>`));
                });
            });
        }

        showProjects();
    } 
});
