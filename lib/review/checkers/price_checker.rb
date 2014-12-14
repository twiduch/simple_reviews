class PriceChecker
  def check(text)
    @text = text
    any_price? ? bad_result : good_result
  end
  
  private
  def any_price?
    /([£$]|\A)\d+|\d+[£$]|\d+\W+pound|\d+\W+dollar|price.*\d+/i.match @text
  end
  
  def bad_result
    {status: false, message: "Sorry you can't mention the price"}
  end
  def good_result
    {status: true, message: "No price"}
  end
end
