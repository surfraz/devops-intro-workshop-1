# Require the bundler gem and then call Bundler.require to load in all gems
# listed in Gemfile.
require 'bundler'
Bundler.require
require 'json/pure'

get '/' do
    "Hello workshoppers!"
end

