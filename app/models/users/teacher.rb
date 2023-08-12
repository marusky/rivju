module Users
  class Teacher < User
    self.table_name = 'users'
  end
end