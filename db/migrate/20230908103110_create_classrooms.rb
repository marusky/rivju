class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.integer :school_year
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
