module Users
  class Teacher < User
    self.table_name = 'users'

    has_many :classrooms, foreign_key: :user_id
  end
end