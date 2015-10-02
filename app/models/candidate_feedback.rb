class CandidateFeedback
  def self.send_feedback candidate
    send_email("front_end") if candidate.front_end_developer?
    send_email("back_end")  if candidate.back_end_developer?
    send_email("mobile")    if candidate.mobile_developer?
    send_email("generic")   if candidate.generic_developer?
  end

  private
    def self.send_email type
      raise "oi"
    end
end
