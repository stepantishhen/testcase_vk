# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Очищаем существующие данные
School.destroy_all

# Создаем школу
school = School.create!(name: 'Школа №1')

# Создаем классы
class_5a = SchoolClass.create!(number: 5, letter: 'А', school: school)
class_5b = SchoolClass.create!(number: 5, letter: 'Б', school: school)
class_6a = SchoolClass.create!(number: 6, letter: 'А', school: school)

# Создаем студентов
students_5a = [
  { first_name: 'Иван', last_name: 'Иванов', surname: 'Иванович' },
  { first_name: 'Петр', last_name: 'Петров', surname: 'Петрович' },
  { first_name: 'Анна', last_name: 'Сидорова', surname: 'Александровна' }
]

students_5b = [
  { first_name: 'Мария', last_name: 'Козлова', surname: 'Ивановна' },
  { first_name: 'Алексей', last_name: 'Смирнов', surname: 'Петрович' }
]

students_6a = [
  { first_name: 'Ольга', last_name: 'Новикова', surname: 'Сергеевна' },
  { first_name: 'Дмитрий', last_name: 'Морозов', surname: 'Александрович' },
  { first_name: 'Елена', last_name: 'Волкова', surname: 'Дмитриевна' }
]

students_5a.each do |student_data|
  Student.create!(student_data.merge(school: school, school_class: class_5a))
end

students_5b.each do |student_data|
  Student.create!(student_data.merge(school: school, school_class: class_5b))
end

students_6a.each do |student_data|
  Student.create!(student_data.merge(school: school, school_class: class_6a))
end
