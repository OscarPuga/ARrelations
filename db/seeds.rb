# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
    ["Carly Fiorina", 1954],
    ["Donald Trump", 1946],
    ["Ben Carson", 1951],
    ["Hillary Clinton", 1947]
]

tasks5 = []

one_year_date = Date.today + 1.year

5.times { |n| tasks5.push({title: "todo " + n.to_s, description: "must be finished at " + n.to_s, completed: false, due_date: one_year_date }) }

users.each do |data|
    name = data[0]
    year = data[1]
    # byebug
    user =  User.create({username: name.split(" ")[1], password_digest: "123"})
    firstname = name.split(" ")[0]
    profile = Profile.create(
        {first_name: firstname, last_name: name.split(" ")[1], birth_year: year, gender: firstname[-1]=="y"? "female" : "male"})
    user.profile = profile
    
    user.todo_lists.create({list_name: firstname + "' tasks", list_due_date: one_year_date })
    
    tasks5.each { |t|  user.todo_lists.first.todo_items.create(t) }
    
end

