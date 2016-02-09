class User < ActiveRecord::Base
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
