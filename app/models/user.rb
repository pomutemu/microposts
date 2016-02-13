class User < ActiveRecord::Base
  has_many :microposts

  has_many :following_relationships, {
    class_name:  "Relationship",
    foreign_key: "follower_id",
    dependent:   :destroy,
  }

  has_many :following_users, {
    through: :following_relationships,
    source: :followed,
    foreign_key: "followed_id",
  }

  has_many :follower_relationships, {
    class_name:  "Relationship",
    foreign_key: "followed_id",
    dependent:   :destroy,
  }

  has_many :follower_users, {
    through: :follower_relationships,
    source: :follower,
    foreign_key: "follower_id",
  }

  has_secure_password

  valid_email_pat = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 50}

  validates :email, {
    presence: true,
    length: {maximum: 255},
    format: {with: valid_email_pat},
    uniqueness: {case_sensitive: false},
  }

  validates :location, length: {maximum: 50}
  validates :profile, length: {maximum: 255}

  before_save do
    self.email = email.downcase
  end
end
