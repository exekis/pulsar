# app/controllers/polls_controller.rb
class PollsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_poll, only: %i[show edit update destroy]

  def index
    @polls = Poll.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @poll = current_user.polls.build
    3.times { @poll.choices.build }
  end

  def create
    @poll = current_user.polls.build(poll_params)
    if @poll.save
      redirect_to @poll, notice: 'Poll created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @poll.update(poll_params)
      redirect_to @poll, notice: 'Poll updated.'
    else
      render :edit
    end
  end

  def destroy
    @poll.destroy
    redirect_to polls_path, alert: 'Poll deleted.'
  end

  private

  def set_poll
    @poll = Poll.find(params[:id])
  end

  def poll_params
    params.require(:poll)
          .permit(:title,
                  choices_attributes: %i[id text _destroy])
  end
end