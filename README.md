iOS-rails-omniauth-facebook-login
=================================

Trying to understand how to make a native iOS app and a Rails based server that uses omniauth to work together.

*Scenario*

1. A user logs in using the native Facebook login in iOS6 or Safari fast-switching before iOS6

2. This also logs in on the server side using access token received in step 1.

*Why?*

I wanted to login from the client and call REST APIs using the same facebook credential.


*Setup*

After pulling, update submodule to pull the rails server app.
