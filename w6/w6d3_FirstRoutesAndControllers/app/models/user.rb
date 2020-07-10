# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

# After you create each table and model, make sure to test that your associations 
# and validations are working before moving on to the next step. We want to be 
# absolutely sure our code is working before we move on to the next phase, 
# otherwise building our API endpoints will be needlessly complicated.

class User < ApplicationRecord 
    # validates :name, :email, presence: true, uniqueness: true 
    validates :username, presence: true, uniqueness: true
    
    has_many :artworks, 
    foreign_key: :artist_id, 
    class_name: :Artwork 

    has_many :artwork_shares, #this is referring to the users artwork_shares 
    foreign_key: :viewer_id, 
    class_name: :ArtworkShare 


    has_many :shared_artworks #we are looking for artworks that have been shared
    through: :artwork_shares, 
    source: :artwork
    #  return the set of artworks that have been shared with 
    # that user (not the set of artworks that a user has shared with others).


    # or could it be
    # has_many :shared_artworks 
    # through: :artworks, 
    # source: :artwork_shares this return all shares of an artist 

end


