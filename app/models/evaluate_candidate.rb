class EvaluateCandidate
  def initialize candidate
    @candidate = candidate
  end

  def send_feedback
    %w(front_end back_end mobile generic).each do |developer_type|
      feedback_by_type(developer_type) if send("#{developer_type}_developer?")
    end
  end

  private
    def feedback_by_type developer_type
      CandidateMailer.developer_type_email(developer_type, @candidate.email).deliver
    end

    def front_end_developer?
      if @candidate.html.present? && @candidate.css.present? && @candidate.javascript.present?
        @candidate.html.to_i >= 7 && @candidate.css.to_i >= 7 && @candidate.javascript.to_i >= 7
      else
        false
      end
    end

    def back_end_developer?
      if @candidate.python.present? && @candidate.django.present?
        @candidate.python.to_i >= 7 && @candidate.django.to_i >= 7
      else
        false
      end
    end

    def mobile_developer?
      (@candidate.dev_ios.present? && @candidate.dev_ios.to_i >= 7) || (@candidate.dev_android.present? && @candidate.dev_android.to_i >= 7)
    end

    def generic_developer?
      not (front_end_developer? || back_end_developer? || mobile_developer?)
    end
end
