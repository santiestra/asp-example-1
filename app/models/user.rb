# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_tenant(:company)
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  def jwt_token
    payload = { user_id: id, company_id: company.id }

    JWT.encode payload, ENV['SECRET_JWT'], 'HS256'
  end
end
