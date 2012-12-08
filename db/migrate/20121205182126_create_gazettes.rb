class CreateGazettes < ActiveRecord::Migration
  def change
    create_table :gazettes do |t|
      t.text :content
      t.integer :ly_id
      t.timestamps
    end
    change_column :gazettes, :content, :text, :limit => 4294967295
  end
end
