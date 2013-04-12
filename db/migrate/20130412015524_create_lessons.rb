class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.integer :user_id
      t.date :occurs_at_date
      t.time :occurs_at_time
      
      t.timestamps
    end
    add_index :lessons, [:user_id, :occurs_at_date, :occurs_at_time]
  end
end
