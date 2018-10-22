# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
gem "activerecord-import"
gem "json"

course_list = JSON.parse(File.read('db/course.json'))
values_course = []
columns_course = [ :course_code, :course_name, :course_description, :subject_id ]
# columns_course = [ :course_code, :course_name, :course_description]
# puts "=========#{course_list[0]['subjects'][0]["id"]}"
course_list.each do |course|
  values_course << Course.new(course_code:course['code'], course_name:course['name'],
    course_description:course['description'], subject_id:course['subjects'][0]['id'])
  # values_course << Course.new(course_code:course['code'], course_name:course['name'],
  #   course_description:course['description'])
end

instructor_list = JSON.parse(File.read('db/instructor.json'))
values_instructor = []
columns_instructor = [ :instructor_id, :instructor_first, :instructor_middle, :instructor_last, :instructor_email ]
instructor_list.each do |i|
  values_instructor << Instructor.new(instructor_id:i['id'], instructor_first:i['first'], instructor_middle:i['middle'],
    instructor_last:i['last'], instructor_email:i['email'])
end

subject_list = JSON.parse(File.read('db/subject.json'))
values_subject = []
columns_subject = [ :subject_id, :subject_comment, :subject_term, :subject_name, :subject_abbreviation ]
subject_list.each do |s|
  values_subject << Subject.new(subject_id:s['id'], subject_comment:s['comment'], subject_term:s['term'],
  subject_name:s['name'],subject_abbreviation:s['abbreviation'])
end

Course.import columns_course, values_course
Instructor.import columns_instructor, values_instructor
Subject.import columns_subject, values_subject
