class Stat < ActiveRecord::Base
  before_validation :calcule_ratio

  def self.create_initial
    self.create({
      count_mutant_dna: 0,
      count_human_dna: 0,
      ratio: 0.0
    })
  end
  
  def add_record(isMutant)
    attrs = {
      count_human_dna: isMutant ?  self.count_human_dna : self.count_human_dna + 1,
      count_mutant_dna: isMutant ? self.count_mutant_dna + 1 : self.count_mutant_dna,   
      ratio: calcule_ratio
    }
    self.update(attrs)
  end

  private
  def calcule_ratio
    self.ratio =  self.count_human_dna == 0  ? 1 : self.count_mutant_dna / self.count_human_dna
  end
end
