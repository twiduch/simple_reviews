require "checkers/offensive_words_checker"
require "checkers/repetition_checker"
require "checkers/price_checker"
require 'forwardable'

class TestingTemplate
  extend Forwardable
  
  attr_accessor :procedures
  def_delegators :@procedures, :size, :<<
  
  def initialize(procedures = [OffensiveWordsChecker, RepetitionChecker, PriceChecker])
    @procedures = procedures
  end
  
  def verify(paragraph)
    result = test_results(paragraph).detect {|r| !r[:status]} || {status: true, message: "OK"}
    {status: result[:status],
     message: result[:message]
    }
  end
  
  def test_results(paragraph)
    procedures.map {|p| p.new.check(paragraph)}
  end
end
