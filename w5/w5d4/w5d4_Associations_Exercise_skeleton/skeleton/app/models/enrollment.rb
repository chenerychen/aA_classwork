# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
    validates :created_at, :updated_at, presence: true

    belongs_to :course, 
        primary_key: :id,
        foreign_key: :course_id,
        class_name: :Course  

    belongs_to :user, 
        primary_key: :id, #User id 
        foreign_key: :student_id, #Enrollment student_id
        class_name: :User
end
# id: 1
# id: 2
# id: 3
# id: 4, ...
# id: 5, course_id: 101, student_id: 5, created_at: Jan-01-20@,
# id: 6, course_id: 104,...