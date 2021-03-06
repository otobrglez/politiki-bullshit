require_relative 'boot'

require 'newrelic_rpm'


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
    %meta{property: "og:type", content:"website"}/
    %meta{name:"og:title", content:shit.to_s}
    %meta{name:"og:site_name", content:"Politiki.si"}
    %meta{name:"og:url", content: shit_url}
    %meta{name:"og:description", content: "Generator političnega blefa!"}
    %meta{name:"og:locale", content:"sl_SI"}
    %meta{name:"fb:app_id", content:"771031166289168"}
    %meta{name:"fb:admins", content:"1014463747,100005581602540"}
    %meta{name:"viewport", content:"width=device-width, initial-scale=1, maximum-scale=1"}
    %meta{name:"og:image", content:"./politiki_social.png"}
    %link{href:"http://fonts.googleapis.com/css?family=Roboto:700,400,300,100&subset=latin,latin-ext", rel:"stylesheet"}
    %link{rel: 'stylesheet', href: './app.css', type: 'text/css'}/
    %link{rel:"icon", type:"image/png", href:"./favicon.png"}
    %link{rel:"apple-touch-icon", href:"./apple-touch-icon.png"}
    %link{rel:"apple-touch-icon", sizes:"72x72", href:"./apple-touch-icon-72x72.png"}
    %link{rel:"apple-touch-icon", sizes:"114x114", href:"./apple-touch-icon-114x114.png"}
  %body
    %header#header
      .container
        %h1 Generator političnega blefa
        %h3= shit
        %a.generate{href:"/"} Hočem nov blef!
        %p Deli s prijatelji

        %table{border:"0", style:"margin: 0px auto; width: 150px;"}
          %tr
            %td
              .fb-like{"data-href"=>shit_url, "data-layout"=>"button_count", "data-action"=>"like", "data-show-faces"=>"false", "data-share"=>"true"}
            %td{style:"width:50%"}
              %a.twitter-share-button{href:"https://twitter.com/share", "data-count"=>"horizontal", "data-url"=>shit_url, "data-text"=>"#{shit.to_s}"} Share on twitter

        %br/
        %small
          %form
            %input{value:"#{shit_url}"}
    %footer#footer
      %p
        Made by
        %a{href:"https://twitter.com/otobrglez"} @otobrglez
        &amp;
        %a{href:"https://twitter.com/xzarexhc"} @xzarexhc
        \|
        Share with <3
        \|
        %a{href:"/all.html"} Seznam vseh.
        \|
        %a{href:"https://github.com/otobrglez/politiki-bullshit"} Koda projekta
        %br/
        Vir: Blefsikon govorništva, co libris

    :javascript
      /* FB */
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

      /* GA */
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-2138405-31', 'auto');
      ga('send', 'pageview');

      /* Twitter */
      window.twttr=(function(d,s,id){var t,js,fjs=d.getElementsByTagName(s)[0];
      if(d.getElementById(id)){return}js=d.createElement(s);
      js.id=id;js.src="https://platform.twitter.com/widgets.js";
      fjs.parentNode.insertBefore(js,fjs);
      return window.twttr||(t={_e:[],ready:function(f){t._e.push(f)}})}(document,"script","twitter-wjs"));

