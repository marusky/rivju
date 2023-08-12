module Users
  class Admin < User
    self.table_name = 'users'
  end
end
