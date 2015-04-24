# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{username: "austinjuliuskim", password: "password", email: "austin@example.com"}, {username: "conrad", password: "password", email: "conrad@example.com"}])

posts = Post.create([{user_id: 1, body: "Hello"}, {user_id: 2, body: "Hi"}])