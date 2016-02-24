class AddIndexToCoursesCourseNumber < ActiveRecord::Migration
  def change
    add_index :courses, :course_number, unique: true
  end
end
