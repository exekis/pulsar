# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :polls,   dependent: :destroy
  has_many :votes,   dependent: :destroy

end