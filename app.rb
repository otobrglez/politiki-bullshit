require_relative 'boot'

configure do
  enable :inline_templates
  set :show_exceptions, false
end

helpers do
  def shit
    @shit ||= Bullshit.new(params[:captures].try(:first))
  end
end

error do |err|
  halt(404, "Nič ni tukaj.")
end

get '/' do
  haml :index
end

get %r{^\/(\d+\-\d+\-\d+\-\d+){1}$} do
  haml :index
end

__END__

@@ layout
%html
  %head
    %title Politiki
  %body
    = yield

@@ index
%h1 Generator političnega blefa
%p=shit
%a{href:"/#{shit.seed}"} Povezava do tega blefa.
\|
%a{href:"/"} Hočem nov blef!
