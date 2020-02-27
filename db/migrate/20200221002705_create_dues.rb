class CreateDues < ActiveRecord::Migration[6.0]
  def change
    create_table :dues do |t|
      t.text :description
      t.string :title
      t.decimal :amount
      t.string :status
      t.timestamps
    end
  end
end
