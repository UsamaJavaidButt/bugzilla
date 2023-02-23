class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bugs, dependent: :destroy
  has_many :project_users
  has_many :projects, through: :project_users, dependent: :destroy

  enum user_type: { Developer: 0, Manager: 1, Qa: 2 }
  enum status: { users_not_added: 0, users_added: 1 }

  validates_presence_of :name, :user_type

  def first_name
    name.split.first
  end

  def last_name
    name.split.lasts
  end
end
