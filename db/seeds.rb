# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Organizations

lakers = Organization.create(name: "Los Angeles Lakers")
knicks = Organization.create(name: "New York Knicks")

#Employees

emp1 = Employee.new(first_name: "Jeanie", last_name: "Buss", title: "Owner", lead: true, email: "jeanie@gmail.com", password_digest: BCrypt::Password.create("password"), organization_id: lakers.id)
emp2 = Employee.new(first_name: "Magic", last_name: "Johnson", title: "President", lead: true, email: "magic@gmail.com", password_digest: BCrypt::Password.create("password"), organization_id: lakers.id)
emp3 = Employee.new(first_name: "Luke", last_name: "Walton", title: "Coach", lead: true, email: "luke@gmail.com", password_digest: BCrypt::Password.create("password"), organization_id: lakers.id)
emp6 = Employee.new(first_name: "Brian", last_name: "Shaw", title: "Asst. Coach", lead: false, email: "brian@gmail.com", password_digest: BCrypt::Password.create("password"), organization_id: lakers.id)
emp4 = Employee.new(first_name: "Lebron", last_name: "James", title: "Captain", lead: false, email: "lebron@gmail.com", password_digest: BCrypt::Password.create("password"), organization_id: lakers.id)
emp5 = Employee.new(first_name: "Dan", last_name: "Schoch", title: "Junior Developer", lead: false, email: "d.schoch90@gmail.com", password_digest: BCrypt::Password.create("password"), organization_id: lakers.id)


emp1.save
emp2.save
emp3.save
emp4.save
emp5.save
emp6.save

#Projects

draft = Project.create(name: "Draft Preparation", due_date: DateTime.now + 70.days, lead_id: emp2.id, description: "Getting Ready for the 2019 draft", organization_id: lakers.id)
game = Project.create(name: "Game Preparation", due_date: DateTime.now + 5.days, lead_id: emp3.id, description: "Make sure we're good to go for the next gamer", organization_id: lakers.id)
web = Project.create(name: "Update Team Website", due_date: DateTime.now + 30.days, lead_id: emp1.id, description: "Migrate team website to react and rails", organization_id: lakers.id)


#Tasks

Task.create(content: "Scout College Players", lead_notes: "Check out Duke first.... Zion looks really good", completed: false, project_id: draft.id, employee_id: emp6.id, due_date: DateTime.now + 30.days)
Task.create(content: "Update draft board", lead_notes: "Get it done soon.... draft coming up", completed: false, project_id: draft.id, due_date: DateTime.now + 54.days)
Task.create(content: "Watch tape", lead_notes: "Focus on James Harden", completed: true, project_id: game.id, employee_id: emp4.id,due_date: DateTime.now + 2.days)
Task.create(content: "Get treatment", lead_notes: "Gotta get back in the game", completed: false, project_id: game.id, employee_id: emp4.id, due_date: DateTime.now + 2.days)
Task.create(content: "Do design mockup", lead_notes: "Need some ideas for the new look", completed: false, project_id: web.id, due_date: DateTime.now + 20.days)
Task.create(content: "Migrate database", lead_notes: "Don't mess this up. Need that data.", completed: false, project_id: web.id, due_date: DateTime.now + 15.days)
Task.create(content: "Create React Components for landing page", lead_notes: "Landing page needs to be done first. This is priority to other pages", completed: false, project_id: web.id, employee_id: emp5.id, due_date: DateTime.now + 29.days)

#Comments
