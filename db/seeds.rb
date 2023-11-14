# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Deleting all previous record"

Profile.delete_all

p "Delete them"

p "Creating few profile"

profile = Profile.create!(name: "Simone", surname: "Roveri", linkedln: "https://www.linkedin.com/in/simone-roveri/", birthday: "1991-06-14")
p "Create #{profile.name} profile"

p "Done!!"
