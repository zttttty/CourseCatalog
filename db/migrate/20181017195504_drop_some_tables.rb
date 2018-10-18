class DropSomeTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :people
    drop_table :subjects
  end
end
