#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'net/http'

# Modify this to use your client id and url.
# Client secret should be stored as an environment variable, IG_CLIENT_SECRET
# To set this for the heroku server use this from the command line:
# heroku config:set IG_CLIENT_SECRET=yourclientsecretabcdefg
redirect_url = ENV['IG_REDIRECT_URL']
client_id =  ENV['IG_CLIENT_ID']
client_secret = ENV['IG_CLIENT_SECRET']

get '/' do
  "It worked!\n"
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
