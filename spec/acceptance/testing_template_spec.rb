# encoding: UTF-8
require "spec_helper"
require "testing_template"

describe TestingTemplate do
  it "initializes with 3 checks" do
    expect(TestingTemplate.new.procedures.size).to eq 3
  end
  
  it "can initialize with different procedures" do 
    expect(TestingTemplate.new([PriceChecker]).procedures.size).to eq 1
  end
  
  it "can add procedures dynamically" do 
    template = TestingTemplate.new([PriceChecker])
    template << RepetitionChecker
    expect(template.procedures).to include RepetitionChecker
  end
  
  describe "checking bad messages" do 
    let(:offensive) {"That should be by Hamster !"}
    let(:offensive_response) {{:status=>false, :message=>"Sorry you can't use bad language"}}
 
    it "should report offensive" do 
      expect(TestingTemplate.new.verify(offensive)).to eq offensive_response
    end
    
    let(:repeated) {"The bad bad bad manner."}
    let(:repeated_response) {{:status=>false, :message=>"Sorry you can't have repetition"}}
    
    it "should report repetition" do 
      expect(TestingTemplate.new.verify(repeated)).to eq repeated_response
    end
    
    let(:pricing) {"The item costs about 23.2 dollars"}
    let(:pricing_response) {{:status=>false, :message=>"Sorry you can't mention the price"}}
    
    it "should report price" do 
      expect(TestingTemplate.new.verify(pricing)).to eq pricing_response
    end
  end
  
  describe "checking correct messages" do 
    let(:proper) {"This is stndard ph good good message before 15pm"}
    let(:proper_response) {{:status=>true, :message=>"OK"}}
    
    it "should report repetition" do 
      expect(TestingTemplate.new.verify(proper)).to eq proper_response
    end
  end
end
