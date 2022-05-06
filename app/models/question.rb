class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, optional: true, class_name: 'User'
  validates :body, presence: true, length: { maximum: 280 }
end
