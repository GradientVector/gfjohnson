class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.datetime :date_time
      # t.integer :duration_in_minutes
      
      t.timestamps
    end
    add_index :lessons, [:user_id, :date_time]
  end
end
