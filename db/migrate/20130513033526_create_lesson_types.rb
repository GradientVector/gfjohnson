class CreateLessonTypes < ActiveRecord::Migration
  def change
    create_table :lesson_types do |t|
      t.string :name

      t.timestamps
    end

    add_column :lessons, :lesson_type_id, :integer
  end
end
