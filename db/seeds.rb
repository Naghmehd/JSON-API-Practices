# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
  user = User.create!(username: Faker::Superhero.name)
end

20.times do
  post = Post.create!(title: Faker::Hipster.word,
                      body: Faker::Hipster.sentence(3),
                      user_id: User.all.sample.id)
end
