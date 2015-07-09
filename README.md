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

### Usage on free heroku

Download the heroku toolbelt and install as per the instructions on the heroku website:
[https://toolbelt.heroku.com](https://toolbelt.heroku.com)

Login to heroku:

```
heroku login
```

Create a heroku app for the OAuthProxy:

```
heroku create
```

This will output the url of your new app, write it down somewhere. Example: ```https://floating-mesa-1234.herokuapp.com/```

Push the code to your heroku app:

```
git push heroku master
```

This will again output the url heroku generates. Visit this URL in your browser and make sure it says "It worked!" to confirm the sinatra app is running.

Once that is running, we need to now inform heroku of our environment variables:

```
heroku config:set IG_CLIENT_SECRET=your.client.secret.goes.here
heroku config:set IG_CLIENT_ID=your.client.id.goes.here
heroku config:set IG_REDIRECT_URL=swiftyphotos://did_log_in
```

Your server should now be good to go! You can do a full test by grabbing the access code from your app by logging it to the console, then using curl from the command line, combining your heroku app's URL and the path /get_token, with a data argument for the "code" value.

Example:

```
curl -d code=00025cc10a95acbdd1123abac1 https://floating-mesa-1234.herokuapp.com//get_token
```

If all went well, you should get back some JSON showing your access_token, and some basic profile information such as the username, bio, website, and profile picture url.

