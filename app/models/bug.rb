class Bug < ApplicationRecord
  enum type_value: { Feature: 0, Bug: 1 }
  enum status: { New: 0, Started: 1, Completed: 2, Resolved: 3 }

  belongs_to :project

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :developer, class_name: 'User', foreign_key: 'developer_id', optional: true

  validates_presence_of :title, :type_value, presence: true
  validates_uniqueness_of :title, scope: :project_id
  has_one_attached :avatar
end
