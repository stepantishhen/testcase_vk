class SchoolClassSerializer < ActiveModel::Serializer
  attributes :id, :number, :letter, :students_count
end