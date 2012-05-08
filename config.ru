require 'rubygems'
require 'sinatra'
require './service_disruption_server'

set :environment, :production

# always put this line last so that all of your settings are properly loaded before sinatra is booted up
run Sinatra::Application
