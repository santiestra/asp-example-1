class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, presence: true, length: { minimum: 5, maximum: 30  }
  validates :content, presence: true, length: { minimum: 5 }

  scope :for_company, -> (company_id) do
    joins(:user).where(company_id: company_id)
  end
end
