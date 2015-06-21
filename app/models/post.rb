class Post < ActiveRecord::Base

  validates :name, presence: true
  validates :comment, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-.]+@[a-z\d\-.]+\.[a-z]+)??\z/i
  validates :email, format: { with: VALID_EMAIL_REGEX }

end
