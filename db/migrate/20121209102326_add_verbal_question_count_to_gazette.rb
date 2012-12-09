# -*- encoding : utf-8 -*-
class AddVerbalQuestionCountToGazette < ActiveRecord::Migration
  def change
    add_column :gazettes, :verbal_questions_count, :integer, :default => 0
  end
end
