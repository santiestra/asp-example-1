# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :users
  has_many :posts
  has_many :comments
end
