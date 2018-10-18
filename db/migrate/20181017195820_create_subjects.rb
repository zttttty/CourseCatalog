class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :subject_id
      t.string :subject_comment
      t.string :subject_term
      t.string :subject_name
      t.string :subject_abbreviation
      t.timestamps
    end
  end
end
