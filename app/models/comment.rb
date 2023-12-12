class Comment < ApplicationRecord
  belongs_to :reviewer, class_name: 'Users::Student', foreign_key: :user_id
  belongs_to :review

  def show_after_line
    to_line || from_line
  end
end
