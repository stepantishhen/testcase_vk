class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :surname, :class_id, :school_id
end