class CreateStats < ActiveRecord::Migration[6.1]
  def change
    create_table :stats do |t|
      t.integer :count_mutant_dna
      t.integer :count_human_dna
      t.float   :ratio 
      t.timestamps
    end
  end
end
