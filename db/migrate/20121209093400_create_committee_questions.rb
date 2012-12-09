class CreateCommitteeQuestions < ActiveRecord::Migration
  def change
    create_table :committee_questions do |t|
      t.integer :committee_id
      t.integer :question_id
      t.timestamps
    end
  end
end
