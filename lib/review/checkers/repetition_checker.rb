class RepetitionChecker
  def check(text)
    @text = text
    any_repetition? ? bad_result : good_result
  end
  
  private
  def any_repetition?
    /\b(\w+)\W+\1\W+\1\b/i.match @text
  end
  
  def bad_result
    {status: false, message: "Sorry you can't have repetition"}
  end
  def good_result
    {status: true, message: "No repetition"}
  end
end
