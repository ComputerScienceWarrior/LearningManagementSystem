class AddEnrolledCoursesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :enrolled_courses, :integer, array: true, default: []
  end
end
