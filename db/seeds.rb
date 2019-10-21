# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
company = Company.create(name: 'Test Company')
company2 = Company.create(name: 'The Other Company')

user = User.new(name: 'Pedro', email: 'pedro-test@test.com', password: '121343', company: company)
user.save!

user2 = User.new(name: 'Juan', email: 'juan-test@test.com', password: 'efefef12', company: company2)
user2.save!

category = Category.create(code: 'rails', description: 'Posts sobre Rails')

post = Post.new(title: 'Nuevo Post', content: 'Some content', date: DateTime.now, user: user, category: category, company: company)
post.save!

post2 = Post.new(title: 'Otro Post', content: 'Some content', date: DateTime.now, user: user2, category: category, company: company2)
post2.save!

comment = Comment.create(text: 'Lorem ipsum', date: DateTime.now, post: post, user: user, company: company)
