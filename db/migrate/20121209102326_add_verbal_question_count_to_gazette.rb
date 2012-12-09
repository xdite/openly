class AddVerbalQuestionCountToGazette < ActiveRecord::Migration
  def change
    add_column :gazettes, :verbal_questions_count, :default => 0
  end
end
