class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.valid?
      evaluate_candidate = EvaluateCandidate.new(@candidate)
      evaluate_candidate.send_feedback
      redirect_to action: :new
    else
      render action: :new
    end
  end

  private
    def candidate_params
      params[:candidate]
    end
end
