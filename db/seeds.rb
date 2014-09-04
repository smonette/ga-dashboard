# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


steph = User.new(first_name: "Steph",
        last_name: "Money", email: "steph@mail.com",
        password: "12341234", password_confirmation: "12341234")

adam = User.new(first_name: "Adam",
        last_name: "Budik", email: "adam@mail.com",
        password: "12341234", password_confirmation: "12341234")

austim = User.new(first_name: "Austin",
        last_name: "West", email: "austin@mail.com",
        password: "12341234", password_confirmation: "12341234")