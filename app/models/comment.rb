# frozen_string_literal: true

class Comment < ApplicationRecord
  acts_as_tenant(:company)

  belongs_to :user
  belongs_to :post

  validate :moderation

  private

  def moderation
    if ModerationService.moderate(text)
      errors.add(:text, 'Did not pass the moderation')
    end
  end
end
