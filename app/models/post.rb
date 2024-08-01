class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  validates :title, length: { minimum: 5, maximum: 100 }

  scope :by_user, lambda {|user|
    where(:user_id => user.id)
  }
end
