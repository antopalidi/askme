class User < ApplicationRecord
  has_many :questions, dependent: :delete_all

  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true, email: { mx_with_fallback: true }
  validates :nickname, presence: true, length: { maximum: 40 }, uniqueness: true, format: { with: /\A[a-z\d_]+\z/ }
  validates :header_color, format: { with: /\A#(?:[\da-zA-Z]{3}){1,2}\z/ }

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'wavatar')

  def downcase_nickname
    nickname.downcase!
  end
end
