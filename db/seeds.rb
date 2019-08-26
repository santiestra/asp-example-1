# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.new(name: 'Pedro', email: 'pedro-test@test.com', password: '121343')
user.save!

post = Post.new(title: 'Nuevo Post', content: 'Some content', date: DateTime.now, user: user)
post.save!
