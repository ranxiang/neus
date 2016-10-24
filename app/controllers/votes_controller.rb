class VotesController < ApplicationController
  before_action :authenticate_user!

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.find_or_initialize_by(vote_params)
    if @vote.persisted?
      @vote.deleted = !@vote.deleted
    end

    respond_to do |format|
      if @vote.save
        format.json { render :show, status: :created, location: @vote }
      else
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      vote_params = params.require(:vote).permit(:article_id)
      vote_params[:user_id] = current_user.id
      vote_params
    end
end
