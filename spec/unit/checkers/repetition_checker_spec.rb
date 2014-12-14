# encoding: UTF-8
require "spec_helper"
require "checkers/repetition_checker"

describe RepetitionChecker do
  let(:subject) {RepetitionChecker.new}
  
  let(:good) {["Whoe in Php php and hamSTER", "It is Tok to tO be good",
                "It is aTo to tO be good", "go goo go", " mo mo moo", 
                "!! !! !!", "all right all right all right"]}
  
  let(:good_result) {{:status=>true, :message=>"No repetition"}}
  
  let(:bad) {["It is To to tO be wrong", "It is to o tO be wrong wrong wrong o!",
              "go go go", "     ko     ko       ------   ko noooo",
              "Moon   !  moon   mooN"]}
              
  let(:bad_result) {{:status=>false, :message=>"Sorry you can't have repetition"}}
  
  it "should return true as no repetition in text" do 
    good.each { |text| expect(subject.check(text)).to eq good_result}
  end
  
  it "should return false indicating repetition" do 
    bad.each { |text| expect(subject.check(text)).to eq bad_result }
  end
end
