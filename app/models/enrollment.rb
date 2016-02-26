class Enrollment < ActiveRecord::Base
  
  belongs_to :user 
  belongs_to :course
  validates :user_id, uniqueness: { scope: [:course_id] }
  validates :user_id, presence: true
  validates :course_id, presence: true
  validates :status, presence: true
  
  def self.count_instructors(course_id)
    enrollments = Enrollment.where('course_id = ?', course_id)
    count = 0
    enrollments.each do |enrollment|
      if enrollment.user && (enrollment.user.is_a? Instructor) && (enrollment.status !="Denied")
        count += 1
      end
    end
    return count
  end
  def self.count_students(course_id)
    enrollments = Enrollment.where('course_id = ?', course_id)
    count = 0
    enrollments.each do |enrollment|
      if enrollment.user && (enrollment.user.is_a? Student) && (enrollment.status !="Denied")
        count += 1
      end
    end
    return count
  end
  
  def self.assigned_instructors(course_id)
    enrollments = Enrollment.where('course_id = ?', course_id)
    instructors = Array.new
    enrollments.each do |enrollment|
      if enrollment.user && (enrollment.user.is_a? Instructor) && (enrollment.status !="Denied")
        instructors << enrollment.user
      end
    end
    return instructors
  end

end
