class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :header
      t.text :options, array: true, default: []
      t.text :answer
      t.text :question_type
      t.integer :test_id
      t.timestamps
    end
  end
end
