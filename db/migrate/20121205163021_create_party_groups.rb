# -*- encoding : utf-8 -*-
class CreatePartyGroups < ActiveRecord::Migration
  def change
    create_table :party_groups do |t|
      t.string :name
      t.timestamps
    end
  end
end
