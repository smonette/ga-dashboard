# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


steph = User.create({first_name: "Steph",
        last_name: "Money", email: "steph@mail.com",
        password: "12341234", password_confirmation: "12341234"})

adam = User.create({first_name: "Adam",
        last_name: "Budik", email: "adam@mail.com",
        password: "12341234", password_confirmation: "12341234"})

austin = User.create({first_name: "Austin",
        last_name: "West", email: "austin@mail.com",
        password: "12341234", password_confirmation: "12341234"})

tim = User.create({first_name: "Tim",
        last_name: "Licata", email: "tim@mail.com",
        password: "12341234", password_confirmation: "12341234"})

elie = User.create({first_name: "Elie",
        last_name: "Schoppik", email: "elie@mail.com",
        password: "12341234", password_confirmation: "12341234"})

del = User.create({first_name: "Del",
        last_name: "Reed", email: "del@mail.com",
        password: "12341234", password_confirmation: "12341234"})

anil = User.create({first_name: "Ani",
        last_name: "Brigpal", email: "anil@mail.com",
        password: "12341234", password_confirmation: "12341234"})


Shoutout.create({content: "Anil, thanks for JSON help", user_id: "1"})
Shoutout.create({content: "Great job, Adam!", user_id: "1"})
Shoutout.create({content: "Good work today, Tim", user_id: "5"})
Shoutout.create({content: "Way to go class!", user_id: "4"})
Shoutout.create({content: "The arduino looks great, Austin", user_id: "2"})
Shoutout.create({content: "Del, Thanks for your help.", user_id: "2"})
Shoutout.create({content: "This cohort rocks", user_id: "3"})