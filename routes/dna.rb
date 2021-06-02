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
          puts Stat.all
          {count_mutant_dna: 40, count_human_dna:100, ratio: 0.4}.to_json
        end
      end
    end
  end
end
