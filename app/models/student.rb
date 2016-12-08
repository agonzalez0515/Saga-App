class Student < ApplicationRecord
  belongs_to :team
  belongs_to :teacher, through: :team
  belongs_to :school

  validates :name, :gender, :grade, :GPA, :detentions, presence: true
end
