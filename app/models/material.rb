class Material < ActiveRecord::Base
  belongs_to :course

  validates :title, presence: true
  validates :course_id, presence: true
end
