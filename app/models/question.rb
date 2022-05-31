class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, optional: true, class_name: 'User'

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  validates :body, presence: true, length: { maximum: 280 }
end
