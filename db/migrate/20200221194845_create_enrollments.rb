class CreateEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :enrollments do |t|
      t.integer :user_id
      t.integer :due_id
      t.timestamps
    end
    add_index :enrollments, [:user_id, :due_id]
    add_index :enrollments, :due_id
  end
end
