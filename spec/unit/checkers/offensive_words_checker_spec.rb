# encoding: UTF-8
require "spec_helper"
require "checkers/offensive_words_checker"

describe OffensiveWordsChecker do
  let(:subject) {OffensiveWordsChecker.new}
  
  let(:good) {["Hello hey elderbErr puts go's"]}
  let(:good_result) {{:status=>true, :message=>"Proper language"}}
  
  let(:bad) {["Whoe in Php and hamSTER", "Whoe in php and ",
              "HAMSTER"]}
  let(:bad_result) {{:status=>false, :message=>"Sorry you can't use bad language"}}
  
  it "should return true as no offensive words in text" do 
    good.each { |text| expect(subject.check(text)).to eq good_result}
  end
  
  it "should return false indicating offensive word" do 
    bad.each { |text| expect(subject.check(text)).to eq bad_result }
  end
end
