class CreateCommitteeQuestions < ActiveRecord::Migration
  def change
    create_table :committee_verbal_questions do |t|
      t.integer :committee_id
      t.integer :verbal_question_id
      t.timestamps
    end
  end
end
