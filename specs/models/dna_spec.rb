require_relative "../spec_helper"
require_relative "../../models/dna"

MUTAND_DNA = ["ATGCGA", "CAGTGC", "TTATGT", "AGAAGG", "CCCCTA", "TCACTG" ];
NOT_MUTAND_DNA = [ "ATGCGA", "CAGTGC", "TTATTT", "AGACGG", "GCGTCA", "TCACTG" ];

describe "dna" do
  def app; Dna end

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
end
