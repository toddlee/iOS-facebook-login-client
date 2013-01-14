iOS-rails-omniauth-facebook-login
=================================

Trying to understand how to make a native iOS app and a Rails based server that uses omniauth to work together.

*Scenario*

1. A user logs in using the native Facebook login in (iOS6) or Safari fast-switching(iOS 5 or lower) 

2. A valid user session is created on the server without re-requesting users to login.

*Why?*

Navite iOS apps usually logs users in to Facebook on the client side only.

There needs a way to pass this authenticated status to the server to make user session created on the server (if your service want to use Facebook login to authenticate users)


*Setup*

After pulling, update submodule to pull the rails server app.
# git submodule update --init --recursive


*How does it work*

When Facebook login succeeds on the client side (iOS app), there's access token available. This access token is used to validate users on Facebook.

By passing this to the server, it can ask Facebook to see if this is a valid access token.

Once it's validated, user session could be created.

In this example app, [omniauth facebook-access-token strategy](https://github.com/SoapSeller/omniauth-facebook-access-token) is used.
