class User < ApplicationRecord
  acts_as_tenant(:company)
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
