class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, optional: true, class_name: 'User'

  has_many :question_hashtags, dependent: :destroy
  has_many :hashtags, through: :question_hashtags

  validates :body, presence: true, length: { maximum: 280 }

  after_save_commit :update_hashtags

  private

  def question_tags
    hashtags = "#{body} #{answer}"
    hashtags_from_text(hashtags.downcase).uniq
  end

  def hashtags_from_text(str)
    str.scan(Hashtag::VALID_HASHTAG_REGEX)
  end

  def update_hashtags
    self.hashtags =
      question_tags.map { |tag| Hashtag.create_or_find_by(name: tag.delete('#')) }
  end
end
