# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = []

(1..10).each do |i|
  category = Category.create(name: "category_#{i}")
  categories.push(category.id)
end

200.times.each do |i|
  Item.create(
    title: Faker::Beer.name,
    price: Faker::Number.decimal(2),
    description: Faker::Lorem.sentence,
    category_id: categories.sample
  )
end

puts "Crear 200 items"
