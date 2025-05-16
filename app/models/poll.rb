# app/models/poll.rb
class Poll < ApplicationRecord
  belongs_to :user
  has_many   :choices, dependent: :destroy
  has_many   :votes,   through: :choices

  accepts_nested_attributes_for :choices, allow_destroy: true, reject_if: ->(attr) { attr['text'].blank? }

  validates :title, presence: true, length: { maximum: 200 }
end