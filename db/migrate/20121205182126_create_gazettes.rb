class CreateGazettes < ActiveRecord::Migration
  def change
    create_table :gazettes do |t|
      t.text :content, :limit => 4294967295
      t.integer :ly_id
      t.timestamps
    end
  end
end
