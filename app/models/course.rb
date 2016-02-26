class Course < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :materials , dependent: :destroy
  
  validates :course_number, :title, :start_date, :end_date, :status, presence: true
  
  
  def self.search(search,searchby)
    if searchby =="Instructor"
      #searchby ="user_id"
      results = Array.new
      users = User.where("name LIKE ?","%#{search}%")
      if users.count == 0
        return results
      else
        users.each do |user|
          if user.is_a? Instructor
            enrollments = user.enrollments
            enrollments.each do |enrollment|
              course = enrollment.course
              if course && (!results.include? course)
                results << course
              end
            end
          end
        end
      end
      return results
    end
    if searchby =="Course number"
      searchby = "course_number"
    end
    if searchby =="Status"
      where(status: search)
    else
      where("#{searchby} LIKE ?", "%#{search}%")
    end
  end
  
end
