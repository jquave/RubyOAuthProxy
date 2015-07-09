#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'Net/HTTP'

# Modify this to use your client id and url.
# Client secret should be stored as an environment variable, IG_CLIENT_SECRET
# To set this for the heroku server use this from the command line:
# heroku config:set IG_CLIENT_SECRET=yourclientsecretabcdefg
redirect_url = "swiftyphotos://did_log_in"
client_id = "YOUR_CLIENT_ID"
client_secret = ENV['IG_CLIENT_SECRET']

get '/' do
  "Nothing to see here. Move along.\n"
end
post '/get_token' do
  code = params["code"]
  if !code.nil?
    uri = URI("https://api.instagram.com/oauth/access_token")
    res = Net::HTTP.post_form(uri,
                              "client_id" => client_id,
                              "client_secret" => "#{client_secret}",
                              "grant_type" => "authorization_code",
                              "redirect_uri" => redirect_url,
                              "code" => "#{code}")
    return res.body 
  end
end
