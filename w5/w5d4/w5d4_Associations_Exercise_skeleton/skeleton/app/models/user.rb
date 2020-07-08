# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    validates :name, :created_at, :updated_at, presence: true

    has_many :enrollments,
        primary_key: :id, #User :id
        foreign_key: :student_id, # Enrollment :student_id
        class_name: :Enrollment

    has_many :enrolled_courses,
        through: :enrollments, #User.enrollments
        source: :course        #Enrollments.course
end

# user.enrollments

# id: 4
# id: 5, name: "Jeff", ...
# id: 6