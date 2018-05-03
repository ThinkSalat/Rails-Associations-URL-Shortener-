# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times {u = User.new(email: Faker::Internet.email); u.save!}
10.times do 
  user = User.all.sample
  long_url = Faker::Internet.url
  ShortenedUrl.generate_code(user,long_url)
end
 10.times do
   visitor = User.all.sample
   url = ShortenedUrl.all.sample
   Visit.record_visit!(visitor,url)
 end