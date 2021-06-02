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
      end
    end
  end
end
