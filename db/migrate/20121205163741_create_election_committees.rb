# -*- encoding : utf-8 -*-
class CreateElectionCommittees < ActiveRecord::Migration
  def change
    create_table :election_committees do |t|
      t.integer :election_id
      t.integer :committee_id
      t.timestamps
    end
  end
end
