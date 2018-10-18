json.extract! course, :id, :course_name, :course_description, :course_id, :created_at, :updated_at
json.url course_url(course, format: :json)
