require "sinatra"
require "sinatra/reloader"
require "sinatra/json"
require 'sinatra/activerecord'

Dir[File.join(File.dirname(__FILE__), "/models", "*.rb")].each { |f| require f }
Dir[File.join(File.dirname(__FILE__), "/routes", "*.rb")].each { |f| require f }

class Base < Sinatra::Application
  register Sinatra::Reloader
  register Sinatra::ActiveRecordExtension
  
  config_path = IO.read("config/#{ENV["RACK_ENV"]}")
  
  set :database_file, "config/database.yml"

  set(:config) do
    JSON.parse(config_path)
  end
end
