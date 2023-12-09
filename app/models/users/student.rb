module Users
  class Student < User
    self.table_name = 'users'

    has_many :projects, foreign_key: :user_id
    has_many :reviews, foreign_key: :user_id
    belongs_to :classroom
  end
end