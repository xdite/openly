class CreateVerbalQuestions < ActiveRecord::Migration
  def change
    create_table :verbal_questions do |t|
      t.string :people
      t.text :content
      t.integer :gazette_id
      t.integer :position
      t.timestamps
    end
  end
end
