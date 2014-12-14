# Read from file

class OffensiveWordsList
  attr_reader :filename
  
  def initialize(filename = 'offensive_words.txt')
    @filename = filename
  end
  
  def words_list
    @words_list ||= File.open(file_path).read.downcase.split
  end
  
  def file_path
    File.expand_path("../#{filename}", File.dirname(__FILE__))
  end
end
