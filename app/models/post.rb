class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, presence: true, length: { minimum: 5, maximum: 30  }
  validates :content, presence: true, length: { minimum: 5 }
end
