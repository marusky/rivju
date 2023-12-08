class CreateSubmissions < ActiveRecord::Migration[7.0]
  def change
    create_table :submissions do |t|
      t.belongs_to :project, null: false, foreign_key: true
      t.integer :version, null: false, default: 1

      t.timestamps
    end
  end
end
