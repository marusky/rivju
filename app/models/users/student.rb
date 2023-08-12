module Users
  class Student < User
    self.table_name = 'users'
  end
end