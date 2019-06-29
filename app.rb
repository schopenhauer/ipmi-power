require 'sinatra'
require 'sinatra/config_file'
require 'sinatra/reloader' if development?
require 'dotenv/load'
require 'better_errors'
require 'rubyipmi'

set :public_folder, 'public'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

configure do
  IPMI_NAME = ENV['IPMI_NAME']
  IPMI_HOST = ENV['IPMI_HOST']
  IPMI_USERNAME = ENV['IPMI_USERNAME']
  IPMI_PASSWORD = ENV['IPMI_PASSWORD']
  config_file 'schedule.yml'
end

get '/' do
  # TODO: on/off according to schedule (e.g. settings.schedule)
  ipmi = Rubyipmi.connect(IPMI_USERNAME, IPMI_PASSWORD, IPMI_HOST)
  erb :landing, locals: {
    power_state: ipmi.chassis.power.on?
  }
end

post '/' do
  ipmi = Rubyipmi.connect(IPMI_USERNAME, IPMI_PASSWORD, IPMI_HOST)
  case params[:power]
  when '0'
    ipmi.chassis.power.off
  when '1'
    ipmi.chassis.power.on
  else
    p 'unknown error'
  end
  redirect '/'
end

get '/*' do
  redirect '/'
end
