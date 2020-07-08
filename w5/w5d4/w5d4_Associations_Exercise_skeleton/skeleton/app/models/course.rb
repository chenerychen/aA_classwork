# == Schema Information
#
# Table name: courses
#
#  id            :bigint           not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Course < ApplicationRecord
    validates :created_at, :updated_at, presence: true 
    # course_instance.enrollments 
    # find the enrollments whos course_id mathchs with  
    # coruse_instnace.primary.id
    # has_many foreging_key == class_name 

    has_many :enrollments, 
        primary_key: :id, #Course :id
        foreign_key: :course_id, #Enrollment :course_id
        class_name: :Enrollment 
    
    has_many :enrolled_students,
        through: :enrollments, # course.enrollments
        source: :user          # enrollment.user
    
    # course_instance.prerequisite
    # find the course whose id matches with
    # course_instance: :prereq_id 
    belongs_to :prerequisite, # next_class.prerequisite -> current_class
        primary_key: :id, # Course :id
        foreign_key: :prereq_id, #Course :prereq_id 
        class_name: :Course, 
        optional: true
        # will only allow the model validation not the database constraints in optional
        #error name:nil, id:nil.... 
    
    # course_instance.postrequisite
    # find the course whose prereq_id matches with
    # course_instance: :id 
    has_many :postrequisite, # current_class.postrequisite -> next_class
        primary_key: :id, #course 
        foreign_key: :prereq_id,
        class_name: :Course 

    belongs_to :instructor, 
        primary_key: :id, # User: :id 
        foreign_key: :instructor_id, #Course: :instructor_id
        class_name: :User

    # course_instance.instructor 
    # find the User instance whose User: :id matches with
    # course_instance: :instructor_id 

    # belongs_to : matches FROM self foreign TO class_name primary
    # has_many/has_one : matches FROM self primary TO class_name foreign
    
end

# id: 1, name: Math-101, prereq_id: 10, instructor_id: 4, ...
# id: 2, name: Art-101, prereq_id: 4, instructor_id: 7, ...

# prereq of 6th grade math: 5th grade math -> 6th grade math