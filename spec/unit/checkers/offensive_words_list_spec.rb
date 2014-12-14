# encoding: UTF-8
require "spec_helper"
require "checkers/offensive_words_list"

describe OffensiveWordsList do
 
  let (:subject) {OffensiveWordsList.new}
  
  it "should read words from fil to array" do 
    expect(subject.words_list).to be_a Array
  end
  
  it "should read 4 words" do 
    expect(subject.words_list.count).to be 4
  end
  
  it "should downcase read words" do 
    expect(subject.words_list).to include 'php'
  end
end
