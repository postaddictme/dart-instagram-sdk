instagram-dart
==============
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

var instagramSession = new InstagramSession(accessToken);
var user = instagramSession.getUserById(1);
print(user.userName);
print(user.mediaCount);
