$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "minitest/autorun"
require "spy"

Dir["../lib/snake_ladders/*.rb"].each {|file| require file }

