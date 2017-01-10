# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.admin_users.empty?
  @user = User.new(email: 'admin@example.com', password: 'password', password_confirmation: 'password', active: true)
  @user.save
  @user.make_admin
  puts '********************************************************************'
  puts '*                                                                  *'
  puts '* Your admin account for: http://localhost:3000/manage             *'
  puts '* Email:    admin@example.com                                      *'
  puts '* Password: password                                               *'
  puts '*                                                                  *'
  puts '********************************************************************'
end