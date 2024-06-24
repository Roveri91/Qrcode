# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Deleting all previous record"

Comment.delete_all
Article.delete_all
Profile.delete_all
User.delete_all

p "Deleted them"

p "Creating new user"
user = User.create!(email: "user@example.com", password: "password")

p "Creating new profile"

profile = Profile.create!(name: "Simone", surname: "Roveri", linkedln: "https://www.linkedin.com/in/simone-roveri/", birthday: "1991-06-14", user: user)

p "Create #{profile.name} profile"

p "Done!!"

p "Creating few article"

article = Article.create!(
  profile: profile,
  title: "10 Tips for Successful Ruby on Rails Development",
  content: <<-CONTENT.strip_heredoc
    Ruby on Rails is a powerful web development framework that simplifies the development process
    and encourages best practices. Here are 10 tips to enhance your Ruby on Rails development:

    1. **Follow RESTful conventions:** Design your routes, controllers, and models following RESTful principles.
    2. **Use partials and helpers:** Keep your views DRY by using partials and helpers for reusable code.
    3. **Optimize database queries:** Use ActiveRecord queries efficiently to minimize database hits.
    4. **Implement background jobs:** Offload time-consuming tasks to background jobs using tools like Sidekiq.
    5. **Write tests:** Embrace Test-Driven Development (TDD) and write tests for your models, controllers, and views.
    6. **Secure your application:** Implement proper authentication and authorization mechanisms to secure your app.
    7. **Optimize asset delivery:** Use tools like Webpacker to manage and optimize your front-end assets.
    8. **Monitor performance:** Use tools like New Relic or Scout to monitor and optimize your application's performance.
    9. **Apply caching:** Implement caching strategies to improve response times.
    10. **Stay up-to-date:** Keep your Ruby on Rails version and gems up-to-date for security and performance improvements.

    These tips will help you build robust, scalable, and maintainable Ruby on Rails applications.
    CONTENT
)

p "Create #{article.title} !"

comment = Comment.create!(
  profile: profile,
  article: article,
  content: "Awesome article mate!"
)

p "Create #{comment.profile.name}'s comment"

p "Done!!"
