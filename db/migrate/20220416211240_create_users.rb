class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :password_digest
      t.text :grade
      t.float :gpa
      t.integer :course_id

      t.timestamps
    end
  end
end
