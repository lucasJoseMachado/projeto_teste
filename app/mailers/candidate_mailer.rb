class CandidateMailer < ApplicationMailer
  def developer_type_email candidate_type, candidate_email
    @candidate_type = candidate_type
    @content = "conteudo"
    mail to: candidate_email, subject: "assunto", body: @content
  end
end
