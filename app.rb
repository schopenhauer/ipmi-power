require 'sinatra'
require 'sinatra/config_file'
require 'sinatra/reloader' if development?
require 'dotenv/load'
require 'better_errors'
require 'rubyipmi'
require 'rufus-scheduler'

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

def connect
  Rubyipmi.connect(IPMI_USERNAME, IPMI_PASSWORD, IPMI_HOST)
end

if settings.auto_power == true
  puts 'Using schedule to automatically power on/off.'
  scheduler = Rufus::Scheduler.new
  settings.schedule.map { |day, schedule|
    scheduler.cron schedule[:power_on].split(':').reverse.join(' ') + ' * * ' + day do
      puts 'Automatically switching on... ' + IPMI_NAME
      ipmi = connect()
      ipmi.chassis.power.on
    end
    scheduler.cron schedule[:power_off].split(':').reverse.join(' ') + ' * * ' + day do
      puts 'Automatically switching off... ' + IPMI_NAME
      ipmi = connect()
      ipmi.chassis.power.off
    end
  }
end

get '/' do
  ipmi = connect()
  erb :landing, locals: {
    powerState: ipmi.chassis.power.on?
  }
end

post '/' do
  ipmi = connect()
  case params[:power]
  when '0'
    puts 'Manually switching off... ' + IPMI_NAME
    ipmi.chassis.power.off
  when '1'
    puts 'Manually switching on... ' + IPMI_NAME
    ipmi.chassis.power.on
  else
    puts 'Unknown error'
  end
  redirect '/'
end

get '/*' do
  redirect '/'
end
