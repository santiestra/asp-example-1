# frozen_string_literal: true

class Post < ApplicationRecord
  acts_as_tenant(:company)

  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, presence: true, length: { minimum: 5, maximum: 30 }
  validates :content, presence: true, length: { minimum: 5 }
  validate :moderation

  private

  def moderation
    if ModerationService.moderate(content)
      errors.add(:content, 'Did not pass the moderation')
    end
  end
end
