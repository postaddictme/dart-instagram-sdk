part of dart.instagram_api;

class AccessToken {
	String _token;
	
	AccessToken(this._token);
	
	String get accessToken => _token;
				 set accessToken (String token)
				 	=> _token = token;
				 
}