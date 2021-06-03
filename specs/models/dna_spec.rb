require_relative "../spec_helper"
require_relative "../../models/dna"

MUTAND_DNA = ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCCTA", "TCACTG" ]
NOT_MUTAND_DNA = [ "ATGCGA", "CAGTGC", "TTATTT", "AGACGG", "GCGTCA", "TCACTG" ]
NOT_VALID_DNA = [ "123456", "CAGTGC", "TTATTT", "AGACGG", "GCGTCA", "TCACTG" ]

describe "dna" do
  def app; Dna end
  
  before(:each) do
    Dna.delete_all
    Stat.delete_all
  end

  describe "#isMutand?" do
    it "should respond false when dna is MUTAND_DNA" do
      dna = Dna.new(dna_sequence: MUTAND_DNA)
      isMutand = dna.isMutand?
      expect(isMutand).to eq true
    end

    it "should respond to true when dna is NOT_MUTAND_DNA" do
      dna = Dna.new(dna_sequence: NOT_MUTAND_DNA)
      isMutand = dna.isMutand?
      expect(isMutand).to eq false
    end
  end

  describe "create record" do
    it "should not create with invalid string" do
      dna = Dna.create(dna_sequence: NOT_VALID_DNA)
      expect(dna.errors.messages_for(:sequence)).to eq (["is invalid"])
    end

    it "should create with invalid string" do
      dna = Dna.create(dna_sequence: NOT_MUTAND_DNA)
      expect(Dna.all.count).to eq 1
    end
  end
end
