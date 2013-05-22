class CreatePrivateLessonPackageTypes < ActiveRecord::Migration
  def change
    create_table :private_lesson_package_types do |t|
      t.string :name
      t.integer :duration_in_minutes
      t.integer :cost_in_dollars
      t.boolean :is_active, default: true

      t.timestamps
    end
  end
end
