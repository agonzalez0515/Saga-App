class School < ApplicationRecord
  has_many :students
  has_many :teachers
  has_many :teams
end
