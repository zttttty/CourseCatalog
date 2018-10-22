class ChangeCourse < ActiveRecord::Migration[5.2]
  def change
    change_column :courses, :id, :string
    rename_column :courses, :course_id, :course_code
  end
end
