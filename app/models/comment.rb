# frozen_string_literal: true

class Comment < ApplicationRecord
  acts_as_tenant(:company)

  belongs_to :user
  belongs_to :post
end
