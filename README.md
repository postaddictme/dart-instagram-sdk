instagram-dart
==============

Alpha version, works but has not documented yet and many bugs

Dart Instagram API wrapper

Alpha -- January 2015


UNDER DEVELOPMENT TO USE LIBRARY YOU MUST TURN ON --disable-web-security IN CHROMIUM

For authorization:

  var instagramAuth = new InstagramAuth(
      'clientId',
      'clientSecret',
      'redirectUri');
 
  instagramAuth.responseType = 'code';
  
  OR
  
  instagramAuth.responseType = 'token';
  
  THEN 
  
  Go to instagramAuth.authUri 
  
  After you recieved accessToken: 
  var instagramSession = new InstagramSession(accessToken);
  var user = instagramSession.getUserById(1);
  print(user.userName);
    print(user.mediaCount);