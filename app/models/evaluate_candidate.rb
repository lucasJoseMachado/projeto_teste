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
      true #@candidate.html >= 7 && @candidate.css >= 7 && @candidate.javascript >= 7
    end

    def back_end_developer?
      true #@candidate.python >= 7 && @candidate.django >= 7
    end

    def mobile_developer?
      true #@candidate.dev_ios >= 7 || @candidate.dev_android >= 7
    end

    def generic_developer?
      not (front_end_developer? || back_end_developer? || mobile_developer?)
    end
end
