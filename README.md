# AuthEx - Session Authentication Example For Phoenix Using Guardian ~~1.0-beta~~ 1.0 and LDAP.

This is a barebones example of running simple authentication using Guardian for Phoenix applications.  [Forked from here](https://medium.com/@tylerpachal/session-authentication-example-for-phoenix-1-3-using-guardian-1-0-beta-a228c78478e6).

This example removes the use of Postgre and replaces it with LDAP.  Note that it does not have the Ecto installed.

The example I found by [Richard Nystrom](https://github.com/ricn) was dated but I used his [tutorial](http://rny.io/elixir/phoenix/ldap/2016/09/20/ldap-authenication-with-phoenix.html) as a general guide.

From his guide (about the LDAP server configured):
>The code will give us access to forumsys public LDAP server which have a few users setup: einstein, newton, galieleo, tesla, riemann, gauss, euler, euclid. All the users have the password password
