class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :review, null: false, foreign_key: true
      t.integer :reply_to_comment_id
      t.integer :from_line
      t.integer :to_line
      t.text :content

      t.timestamps
    end
  end
end
