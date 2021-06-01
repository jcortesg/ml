require "sinatra/base"
require "sinatra/reloader"
require "sinatra/json"

require_relative "base"

class App < Sinatra::Application
  register Sinatra::Reloader

  get "/" do
    json :message => "Hello world! X-men APP"
  end
end
