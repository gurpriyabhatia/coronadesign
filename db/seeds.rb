# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
puts "Let's clean this database..."

puts 'Destroying designs...'
Design.destroy_all

puts 'Destroying users...'
User.destroy_all

puts 'Creating user...'
User.create(
  email: "gurpriya@test.com",
  password: "hellohello",
  username: "gurpriya"
  )
puts "Gurpriya created"

puts 'Creating designs...'
  design_1 = Design.new(
    title: "Social Distancing Circles",
    source: "New york Times",
    description: "Newspaper page layout for social disstancing",
    user: User.first
    )
  design_1.photo.attach(io: URI.open('https://res.cloudinary.com/dolzriuzv/image/upload/v1586025890/coronadesign/New-York-Times-SocialDistancing.jpg'), filename: 'newyorktimes.jpg', content_type: 'image/jpg')
  design_1.save!

  design_2 = Design.new(
    title: "Google Doodle",
    source: "Google",
    description: "Google doodle asking the users to stay at home",
    user: User.first
    )
  design_2.photo.attach(io: URI.open('https://res.cloudinary.com/dolzriuzv/image/upload/v1586025890/coronadesign/Screenshot_2020-04-04_at_14.05.50_yeqpw7.png'), filename: 'googledoodle.jpg', content_type: 'image/jpg')
  design_2.save!

 design_3 = Design.new(
    title: "Social Distancing Circles",
    source: "https://www.sueddeutsche.de/wissen/coronavirus-sterblichkeit-dunkelziffer-verdopplung-1.4870041",
    description: "Sueddeutsche Zeitung showing how social disstancing can lower the corona virus curve",
    user: User.first
    )
  design_3.photo.attach(io: URI.open('https://res.cloudinary.com/dolzriuzv/image/upload/v1586540082/coronadesign/SZlowerthecurve_ft3ohu.jpg'), filename: 'SZlowerthecurve.jpg', content_type: 'image/jpg')
  design_3.save!

  design_4 = Design.new(
    title: "Johns Hopkins Corona Virus Resource Center",
    source: "https://coronavirus.jhu.edu/map.html",
    description: "John Hopkins iconic map to keep up with the data and key stats",
    user: User.first
    )
  design_4.photo.attach(io: URI.open('https://res.cloudinary.com/dolzriuzv/image/upload/v1586540360/coronadesign/Screenshot_2020-04-10_at_18.37.07_iq3mjj.png'), filename: 'googledoodle.jpg', content_type: 'image/jpg')
  design_4.save!
