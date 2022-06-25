class AddStudentsToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :students, :integer, :array => true, default: []
  end
end
