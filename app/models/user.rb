class User < ActiveRecord::Base
  has_many :enrollments
  
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  validates :type, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  def self.inherited(child)
    child.instance_eval do
      def model_name
        User.model_name
      end
    end
    super
  end
end


class Student < User

end

class Instructor < User

end

class Admin < User

end