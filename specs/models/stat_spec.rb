require_relative "../spec_helper"
require_relative "../../models/stat"

describe "stat" do
  def app; Stat end
  
  before(:each) do
    Stat.delete_all
    Stat.create_initial
    @stat = Stat.last
  end

  describe "#add_record" do
    it "should respond save when is mutand" do
      @stat.add_record(true) 
      expect(@stat.count_mutant_dna).to eq 1
    end

    it "should respond to save when is human" do
      @stat.add_record(false) 
      expect(@stat.count_human_dna).to eq 1
    end
  end
end
