class Team < ApplicationRecord
  belongs_to :teacher
  belongs_to :school
  has_many :students

  validates :teacher, :school, presence: true
  validates :name, presence: true, uniqueness: {scope: :school}
end
