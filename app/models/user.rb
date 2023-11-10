class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :validatable, :confirmable, :invitable

  validates :first_name, :last_name, presence: true

  enum type: {
    'Users::Student' => 0,
    'Users::Teacher' => 1,
    'Users::Admin' => 2
  }

  def name
    "#{first_name} #{last_name}"
  end

  def admin?
    type == 'Users::Admin'
  end

  def teacher?
    type == 'Users::Teacher'
  end

  def student?
    type == 'Users::Student'
  end

  def teaches_classroom(classroom)
    classroom.user_id == id
  end
end
