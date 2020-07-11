# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#  when we are in the development stage, making feature, 
# User.destroy_all 
# Artwork.destroy_all 
# ArtworkShare.destroy_all


user1 = User.create!(username: 'Yusei')
user2 = User.create!(username: 'Ayce')
user3 = User.create!(username: 'Jen') 

artwork1 = Artwork.create!(title: 'banana', image_url: 'banana.image', artist_id: user1.id) 
artwork2 = Artwork.create!(title: 'orange', image_url: 'orange.image',  artist_id: user2.id)
artwork3 = Artwork.create!(title: 'berry',  image_url: 'berry.image',  artist_id: user3.id)

ArtworkShare.create!(artwork_id: artwork1.id, viewer_id: user3.id)
ArtworkShare.create!(artwork_id: artwork2.id, viewer_id: user1.id)
ArtworkShare.create!(artwork_id: artwork3.id, viewer_id: user1.id)
