# app/models/choice.rb
class Choice < ApplicationRecord
  belongs_to :poll
  has_many   :votes, dependent: :destroy

  validates :text, presence: true, length: { maximum: 100 }
end
