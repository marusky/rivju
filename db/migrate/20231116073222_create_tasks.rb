class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.belongs_to :classroom, null: false, foreign_key: true
      t.belongs_to :assignment, null: false, foreign_key: true
      t.datetime :first_submission_deadline
      t.datetime :review_deadline
      t.datetime :second_submission_deadline

      t.timestamps
    end
  end
end
