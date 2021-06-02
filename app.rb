require "sinatra/base"
require_relative "base"

module Xmen
  class App < Base
    include Xmen::Routes
  end
end
