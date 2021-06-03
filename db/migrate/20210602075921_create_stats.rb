class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.integer :count_mutant_dna, default: 0
      t.integer :count_human_dna,  default: 0
      t.float   :ratio,            default: 0 
      t.timestamps
    end
  end
end
