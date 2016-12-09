class Teacher < ApplicationRecord
  belongs_to :school
  has_many :teams
  has_many :students, through: :teams

  has_secure_password

  validates :name, :school, :email, presence: true
  validates :email, uniqueness: true
  validates :name, uniqueness: true
end
