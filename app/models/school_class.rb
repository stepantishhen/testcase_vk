class SchoolClass < ApplicationRecord
  belongs_to :school
  has_many :students, dependent: :nullify

  validates :number, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :letter, presence: true

  def students_count
    students.count
  end
end