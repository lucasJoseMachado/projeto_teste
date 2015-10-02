class CandidateMailer < ApplicationMailer
  def developer_type_email candidate_type, candidate_email
    subject = I18n.t("candidate_mailer.developer_type_email.subject")
    content = I18n.t("candidate_mailer.developer_type_email.content", type: candidate_type)
    mail to: candidate_email, subject: subject, body: content
  end
end
