class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.integer :artist_id, null: false

      t.timestamps
    end

    add_index :artworks, :title, unique: true
    add_index :artworks, :artist_id, unique: true
  end
end

# For your artworks table you should have the following 
# columns: title, image_url, and artist_id
# All of these should be present. 
# Add ActiveRecord validations and DB constraints.