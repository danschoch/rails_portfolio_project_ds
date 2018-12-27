# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Organizations

Organization.create(name: "Trump Organization")
Organization.create(name: "Campaign")

#Projects

Project.create(name: "Trump Tower Moscow", due_date: DateTime.new.at_midnight, lead_id: 3, description: "corrupt new fancy tower", organization_id: 1)
Project.create(name: "Campaign", due_date: DateTime.new.at_noon, lead_id: 3, description: "corrupt new fancy tower", organization_id: 1)
Project.create(name: "MAGA", due_date: DateTime.new.at_noon, lead_id: 4, description: "Made it pretty self-explanatory, didn't I?", organization_id: 2)


#Employees

emp1 = Employee.new(first_name: "Eric", last_name: "Cartman", title: "Developer", lead: false, email: "lame@gmail.com", password_digest: BCrypt::Password.create("password"), organization_id: 1)
emp2 = Employee.new(first_name: "Ivanna", last_name: "Thump", title: "Wannabe", lead: false, email: "bogus@fake.com", password_digest: BCrypt::Password.create("password"), organization_id: 1)
emp3 = Employee.new(first_name: "Don", last_name: "Julio", title: "Junior Dev", lead: true, email: "extralame@yahoo.com", password_digest: BCrypt::Password.create("password"), organization_id: 1)
emp4= Employee.new(first_name: "Paul", last_name: "Boyabase", title: "Chairman", lead: true, email: "iheartrussia@gmail.com", password_digest: BCrypt::Password.create("password"), organization_id: 2)


emp1.save
emp2.save
emp3.save
emp4.save

#Tasks

Task.create(content: "Pay off some people", lead_notes: "Use the charity money", completed: false, project_id: 1, employee_id: 1)
Task.create(content: "Talk to Putin", lead_notes: "Don't use email or phones, please", completed: true, project_id: 1)
Task.create(content: "Find land", lead_notes: "Find out where exactly Moscow is...", completed: false, project_id: 1, employee_id: nil)

#Comments
