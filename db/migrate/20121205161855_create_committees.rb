# -*- encoding : utf-8 -*-
class CreateCommittees < ActiveRecord::Migration
  def change
    create_table :committees do |t|
      t.string :name # 姓名
      t.integer :party_id
      t.integer :party_group_id
      t.timestamps
    end
  end
end
