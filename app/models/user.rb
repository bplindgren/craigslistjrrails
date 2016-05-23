class User < ActiveRecord::Base
  has_many :posts, foreign_key: :seller_id
  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: true
end
