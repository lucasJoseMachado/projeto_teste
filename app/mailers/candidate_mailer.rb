class CandidateMailer < ApplicationMailer
  def developer_type_email candidate_type, candidate_email
    subject = I18n.t("candidate_mailer.developer_type_email.subject")
    content = content_by_developer_type candidate_type
    mail to: candidate_email, subject: subject, body: content
  end

  private
    def content_by_developer_type candidate_type
      if candidate_type == 'generic'
        content = I18n.t("candidate_mailer.developer_type_email.content.without_area")
      else
        type = I18n.t("candidate.developer_type.#{candidate_type}")
        content = I18n.t("candidate_mailer.developer_type_email.content.with_area", type: type)
      end
    end
end
