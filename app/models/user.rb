class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :email, presence: true, uniqueness: true,
            email: { mx_with_fallback: true }
  validates :nickname, presence: true, length: { maximum: 40 }, uniqueness: true,
            format: { with: /\A[a-z\d_]+\z/ }

  def downcase_nickname
    nickname.downcase!
  end
end
