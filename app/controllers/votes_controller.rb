# app/controllers/votes_controller.rb
class VotesController < ApplicationController
  before_action :authenticate_user!

  def create
    choice = Choice.find(params[:choice_id])
    vote   = choice.votes.build(user: current_user)

    if vote.save
      redirect_to poll_path(choice.poll), notice: 'Vote recorded.'
    else
      redirect_to poll_path(choice.poll), alert: vote.errors.full_messages.to_sentence
    end
  end
end