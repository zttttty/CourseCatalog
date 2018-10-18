class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :instructor_middle
      t.string :instructor_last
      t.string :instructor_first
      t.string :instructor_email
      t.string :instructor_id

      t.timestamps
    end
  end
end
