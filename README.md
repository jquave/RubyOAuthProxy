# RubyOAuthProxy
A simple proxy that helps retrieve the access token from the Instagram API, obscuring the client secret behind a server's env variables.


### Usage on local machine

Checkout the project using git

```
git clone https://github.com/jquave/RubyOAuthProxy.git
```

Change to the directory of the project root

```
cd RubyOAuthProxy
```

Set your env variables for the client secret, client ID, and redirect url from Instagram
```
export IG_CLIENT_SECRET=your.client.secret.goes.here
export IG_CLIENT_ID=your.client.id.goes.here
export IG_REDIRECT_URL=swiftyphotos://did_log_in
```

Now run the server locally..

```
./serve.rb
```

If this fails you may need to install the gem Sinatra first:

```
bundle install
```


