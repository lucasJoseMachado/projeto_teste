class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.valid?
      CandidateFeedback.send_feedback @candidate
      redirect_to action: :new, notice: 'Cadastro finalizado, verifique seu email'
    else
      render action: :new
    end
  end

  private
    def candidate_params
      params[:candidate]
    end
end
