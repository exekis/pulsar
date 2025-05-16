# app/models/vote.rb
class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :choice

  # Enforce one vote per user per poll
  validate :one_vote_per_poll

  private

  def one_vote_per_poll
    if Vote.joins(:choice)
           .where(user_id: user_id, choices: { poll_id: choice.poll_id })
           .where.not(id: id)
           .exists?
      errors.add(:base, "You can vote only once per poll")
    end
  end
end