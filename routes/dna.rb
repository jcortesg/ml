module Xmen
  module Routes
    def self.included app
      app.class_eval do
        get '/' do
          json :message => "Welcome! X-men"
        end
        post '/mutant' do
          params =  JSON.parse request.body.read
          dna = Dna.new(dna_sequence: params["dna"])
          dna.isMutand? ?  status(200) :  status(403)
        end

        get '/stats' do
          stat = Stat.last
          if stat 
            {
              count_mutant_dna: stat.count_mutant_dna, count_human_dna: stat.count_human_dna, ratio: stat.ratio
            }.to_json
          else
            {
              count_mutant_dna: 0, count_human_dna: 0, ratio: 0.0
            }.to_json
          end
        end
      end
    end
  end
end
