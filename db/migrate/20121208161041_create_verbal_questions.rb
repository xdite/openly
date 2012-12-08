class CreateVerbalQuestions < ActiveRecord::Migration
  def change
    create_table :verbal_questions do |t|
      t.text :content
      t.integer :gazette
      t.integer :position
      t.timestamps
    end
  end
end
