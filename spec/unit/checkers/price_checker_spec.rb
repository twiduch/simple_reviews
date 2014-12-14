# encoding: UTF-8
require "spec_helper"
require "checkers/price_checker"

describe PriceChecker do
  let(:subject) {PriceChecker.new}
  
  let(:good) {["The 56 meters"]}
  let(:good_result) {{:status=>true, :message=>"No price"}}
  
  let(:bad) {["i give you the price - 123 dollars"]}
  let(:bad_result) {{:status=>false, :message=>"Sorry you can't mention the price"}}
  
  it "should return true as no repetition in text" do 
    good.each { |text| expect(subject.check(text)).to eq good_result}
  end
  
  it "should return false indicating repetition" do 
    bad.each { |text| expect(subject.check(text)).to eq bad_result }
  end
end
