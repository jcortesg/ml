class Dna < ActiveRecord::Base 
 attr_accessor :dna_sequence
  
  validates :sequence, 
    presence: true,
    uniqueness: true

  validates_format_of :sequence, with: /\A(((?:[ATGC])(?!.*\s))+)\z/i
  before_validation :setSequesce

  MUTAND_SEQUENCE = %w(AAAA TTTT CCCC GGGG )

  def setSequesce 
    self.sequence = self.dna_sequence.join
  end

  def isMutand?
    values = MUTAND_SEQUENCE.map {|string| self.search(string)}
    isMutand = values.inject(:+) > 1 ? true : false
    stats = Stat.last || Stat.create_initial

    if self.save
      stats.add_record(isMutand)
    else
      puts "···Error...."
      puts self.errors.inspect
    end

    isMutand
  end

  def search(string)
    position = []
    direction = []
    count = 0

    all_directions = [   
      [0, 1],
      [1, 1],
      [1, 0],
      [1, -1],
      [0, -1],
      [-1, -1],
      [-1, 0],
      [-1, 1]
    ]

    length = string.length
    rows = self.dna_sequence.length
    number_cols = self.dna_sequence[0].length
    
    matrix = self.dna_sequence.map{|row| row.upcase.split(//) }
    
    sequence = string.upcase.split(//)

    matrix.each_with_index do |row, row_id|
      row.each_with_index do |letter , col_id|
        if( sequence[0] == letter)
          all_directions.each_with_index do |dir, i|
            if (row_id + dir[0] * length >= 0  &&
                row_id + dir[0] * length <= rows &&
                col_id + dir[1] * length >= 0 &&
                col_id + dir[1] * length <= number_cols)

              chars = ""
              sequence.each_with_index do |s_letter, id|
                chars += matrix[row_id + dir[0] * id] [col_id + dir[1] * id];
              end
              count += 1 if chars == string
            end
          end
        end
      end
    end
    count 
  end
end
