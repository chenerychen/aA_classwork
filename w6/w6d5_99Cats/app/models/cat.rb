require 'date'
# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord 
    validates :birth_date, :name, :description, presence: true
    validates :color, presence: true, inclusion: %w(orange black grey white yellow)
    validates :sex, presence: true, inclusion: %w(M F)
    
    validate :age 
    def age 
        # debugger
        date = Date.parse(birth_date.to_s)
        if Date.today.year - date.year >= 0
            Date.today.year - date.year 
        else 
            raise "Invalid Year"
        # elsif Date.today.month - date.month < 0
        #     raise "Invalid month"
        # elsif Date.today.day - date.day < 0
        #     raise "Invalid day"
        end
     end 

end 
