class Classroom < ApplicationRecord
  include Hashid::Rails

  has_many :students, class_name: 'Users::Student', dependent: :delete_all
  belongs_to :teacher, class_name: 'Users::Teacher', foreign_key: :user_id
end
