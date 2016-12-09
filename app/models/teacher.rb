class Teacher < ApplicationRecord
  belongs_to :school
  has_many :teams
  has_many :students, through: :teams

  has_secure_password

  validates :name, :school, :email, presence: true
  validates :email, uniqueness: true
  validates :name, uniqueness: true

  def teacher_code=(input_teacher_code)
    if input_teacher_code == self.school.admin_code
      self.admin = true
    elsif input_teacher_code == self.school.admin_code
      self.admin = false
    else
      errors.add(:admin, "Invalid Code Submitted")
    end
  end

  def teacher_code
    nil
  end
end
