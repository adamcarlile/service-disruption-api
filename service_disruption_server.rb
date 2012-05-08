require 'rubygems'
require 'sinatra'
require 'rabl'
require 'active_support/core_ext'
require 'active_support/inflector'
require 'builder'
require 'service_disruption'

Rabl.register!

get '/' do
  redirect '/network'
end

get '/network' do
  set_network_ivar
  render :rabl, :network, :format => "json"
end

get '/network/:line' do
  set_network_ivar
  @line = @network.lines.select {|x| x.name.downcase.parameterize == params[:line]}.first
  render :rabl, :line, :format => "json"
end

def set_network_ivar
  @network = ServiceDisruption.network
  @network.update! if ServiceDisruption.network.updated_at > 30.seconds.ago
end
