module Users
  class Student < User
    self.table_name = 'users'

    belongs_to :classroom
  end
end