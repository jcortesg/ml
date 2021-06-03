ENV["RACK_ENV"] = "test"

require "rspec"
require "pry"
require "rack/test"
require "json"
require 'simplecov'

SimpleCov.start

RSpec.configure do |c|
  c.include Rack::Test::Methods
end
