$stdout.sync = true

require './app'
# NewRelic::Agent.after_fork(:force_reconnect => true)

run Sinatra::Application
