class Student < ApplicationRecord
  belongs_to :team
  belongs_to :school
  delegate :teacher, to: :team

  validates :name, :gender, :grade, :GPA, :detentions, presence: true
end
