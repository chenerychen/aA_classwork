class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps 
      t.string :email, null: false, index: {unique: true}
    end
  end
end

# add_colmun: tablename, ciolumnnane, datatype, option_hash


#primary id -> stores the order in which you enter the information

#id: 1
#id: 2
#id: 3


# you want look up by email -> order by email (create index)