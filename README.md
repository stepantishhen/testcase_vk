# Профильное задание Ruby on Rails Developer

Простое API для управления данными о школах, классах и учениках.

## Требования

- Ruby 3.2.2
- Rails 8.1.1
- PostgreSQL 14
- Docker
- Docker Compose

## Установка и запуск

1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/stepantishhen/testcase_vk.git
   cd testcase_vk
   ```

2. Запустите приложение с помощью Docker Compose:
   ```bash
   docker compose up -d
   ```

3. Создайте и наполните базу данных:
   ```bash
   docker compose exec web bundle exec rails db:create db:migrate db:seed
   ```

## Тестовые данные

После запуска `db:seed` в базе будут созданы:

1. Школа №1
2. Три класса:
   - 5 "А"
   - 5 "Б"
   - 6 "А"
3. Ученики:
   - В 5 "А": Иван Иванов, Петр Петров, Анна Сидорова
   - В 5 "Б": Мария Козлова, Алексей Смирнов
   - В 6 "А": Ольга Новикова, Дмитрий Морозов, Елена Волкова

## API Endpoints

### 1. Получение списка классов школы

```bash
curl -X GET "http://localhost:3000/api/v1/schools/1/classes"
```

Пример ответа:
```json
{
  "data": [
    {
      "id": 1,
      "number": 5,
      "letter": "А",
      "students_count": 3
    },
    {
      "id": 2,
      "number": 5,
      "letter": "Б",
      "students_count": 2
    }
  ]
}
```

### 2. Получение списка учеников класса

```bash
curl -X GET "http://localhost:3000/api/v1/schools/1/classes/1/students"
```

Пример ответа:
```json
{
  "data": [
    {
      "id": 1,
      "first_name": "Иван",
      "last_name": "Иванов",
      "surname": "Иванович",
      "class_id": 1,
      "school_id": 1
    }
  ]
}
```

### 3. Создание нового ученика

```bash
curl -X POST "http://localhost:3000/api/v1/students" \
     -H "Content-Type: application/json" \
     -d '{
       "student": {
         "first_name": "Новый",
         "last_name": "Ученик",
         "surname": "Тестович",
         "class_id": 1,
         "school_id": 1
       }
     }'
```

При успешном создании вернётся JSON с данными созданного ученика и в заголовке ответа будет токен `X-Auth-Token`, 
который нужно сохранить для последующего удаления ученика.

### 4. Удаление ученика

```bash
# Замените <token> на полученный при создании ученика токен
curl -X DELETE "http://localhost:3000/api/v1/students/1" \
     -H "Authorization: Bearer <token>"
```

## Структура API

- `GET /api/v1/schools/:school_id/classes` - получение списка классов школы
- `GET /api/v1/schools/:school_id/classes/:class_id/students` - получение списка учеников класса
- `POST /api/v1/students` - создание нового ученика
- `DELETE /api/v1/students/:id` - удаление ученика (требует аутентификации)

## Примечания

- Все запросы и ответы используют формат JSON
- Для удаления ученика требуется токен, полученный при его создании
- ID в примерах запросов нужно заменить на реальные из вашей базы данных
- При создании ученика обязательны все поля: first_name, last_name, surname, class_id и school_id
