class Project < ApplicationRecord
  has_many :bugs, dependent: :destroy
  has_many :project_users, dependent: :destroy
  has_many :users, through: :project_users

  # validates_presence_of :title, presence: true
  # validates_uniqueness_of :title
  validates :title, uniqueness: { message: 'must be uniq' }, presence: true
end
