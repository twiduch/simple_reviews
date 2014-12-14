require_relative 'offensive_words_list'

class OffensiveWordsChecker
  attr_reader :list_source
  
  def initialize(list_source = OffensiveWordsList.new)
    @list_source = list_source
  end
  
  def check(text)
    @text = text
    any_offensive? ? bad_result : good_result
  end
  
  private
  def any_offensive?
    offensive_words.any? { |word| /#{word}/i.match @text }
  end
  
  def offensive_words
    list_source.words_list
  end
  
  def bad_result
    {status: false, message: "Sorry you can't use bad language"}
  end
  def good_result
    {status: true, message: "Proper language"}
  end
end
