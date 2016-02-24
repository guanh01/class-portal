class Course < ActiveRecord::Base
  validates :course_number, :title, :start_date, :end_date, :status, presence: true
end
