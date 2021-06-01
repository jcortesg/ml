require "sinatra/base"
require "sinatra/reloader"
require "sinatra/json"

require_relative "base"

class Api < Sinatra::Application
  register Sinatra::Reloader

  get "/" do
    json :message => "Hello world!"
  end
end
