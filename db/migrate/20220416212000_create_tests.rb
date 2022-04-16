class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.text :title
      t.text :questions, array: true, default: []
      t.integer :course_id
      t.integer :user_id

      t.timestamps
    end
  end
end
