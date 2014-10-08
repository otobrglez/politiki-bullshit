require_relative 'boot'

configure do
  enable :inline_templates
  set :show_exceptions, false
end

helpers do
  def shit
    @shit ||= Bullshit.new(params[:captures].try(:first))
  end

  def shit_url
    base = ENV["RACK_ENV"]=="production"? "http://www.politiki.si" : ""
    "#{base}/#{shit.seed}"
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

get '/api/shit.json' do
  content_type :json
  shit.to_json
end

get %r{^\/api\/shits\/(\d+\-\d+\-\d+\-\d+){1}\.json$} do
  content_type :json
  shit.to_json
end

__END__

@@index
%html
  %head
    %meta{charset: 'UTF-8'}/
    %title Generator političnega blefa
    %link{rel: 'stylesheet', href: './app.css', type: 'text/css', media: 'all'}/
    %meta{property: "og:type", content:"website"}/

    -# <meta name="twitter:title" property="og:title" itemprop="title name" content="Finding lines in a text file matching a regular expression" />
    -# <meta name="twitter:description" property="og:description" itemprop="description" content="Can anyone explain how I could use regular expressions in Ruby to only return the matches of a string.
    -# <meta property="og:url" content="http://stackoverflow.com/questions/6002868/finding-lines-in-a-text-file-matching-a-regular-expression"/>
    -# <link rel="canonical" href="http://stackoverflow.com/questions/6002868/finding-lines-in-a-text-file-matching-a-regular-expression" />

    %meta{name:"og:title", content:shit.to_s}
    %meta{name:"og:site_name", content:"Politiki.si"}
    %meta{name:"og:url", content: shit_url}
    %meta{name:"og:description", content: "Generator političnega blefa!"}
    %meta{name:"og:locale", content:"sl_SI"}
    %meta{name:"fb:app_id", content:"771031166289168"}
  %body
    :javascript
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '771031166289168',
          xfbml      : true,
          version    : 'v2.1'
        });
      };

      (function(d, s, id){
         var js, fjs = d.getElementsByTagName(s)[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement(s); js.id = id;
         js.src = "//connect.facebook.net/en_US/sdk.js";
         fjs.parentNode.insertBefore(js, fjs);
       }(document, 'script', 'facebook-jssdk'));

    .wrap
      %h1 Generator političnega blefa
      %p=shit
      %a{href:shit_url} Povezava do tega blefa.
      \|
      %a{href:"/"} Hočem nov blef!

      %br/
      .fb-like{"data-share"=>"true", "data-width"=>"450", "data-show-faces"=>"true"}


      %br/
      %small
        %a{href:"/all.html"} Seznam vseh.
    %footer
      %p
        Made by
        %a{href:"https://twitter.com/otobrglez"} @otobrglez
        &amp;
        %a{href:"https://twitter.com/xzarexhc"} @xzarexhc
        \|
        Share with <3


