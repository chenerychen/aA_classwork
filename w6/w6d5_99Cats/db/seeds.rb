# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# t.date "birth_date", null: false
# t.string "color", null: false
# t.string "name", null: false
# t.string "sex", limit: 1, null: false
# t.text "description", null: false

Cat.destroy_all 
Cat.create!(
    name: 'Garfield',
    color: 'orange',
    sex: 'M',
    birth_date: '3rd April 2001', 
    description: 'Garfield is a real cat. Jon is his owner.'
) 

Cat.create!(
    name: 'Hello Kitty',
    color: 'white',
    sex: 'F',
    birth_date: '3rd May 1990', 
    description: 'Hello Kitty is a british girl.'
) 