json.extract! instructor, :id, :instructor_middle, :instructor_last, :instructor_first, :instructor_email, :instructor_id, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
