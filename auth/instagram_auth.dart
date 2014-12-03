part of dart.instagram_api;

class InstagramAuth {
	String _redirectUri;
	String _clientId;
	String _clientSecret;
	String _accessToken;
	  User _sessionUser;
	String _scope = 'likes+comments+relationships+basic';
	String _responseType='token';
	
	InstagramAuth(this._clientId, this._clientSecret, this._redirectUri);
	
	String get authUri {
		if ( clientId == null || redirectUri == null ) {
			throw 'Please make sure that the clientId and redirectUri fields are set';
		}
		
		Map<String, String> map = new Map<String, String>();
		map['client_id'] = clientId;
		map['redirect_uri'] = redirectUri;
		map['response_type'] = responseType;
		map['scope'] = scope;
		return UriConstructor.constructUri(UriFactory.USER_AUTHORIZATION, map);
	}
	
	void buildToken(String code) {
		if (clientId == null || clientSecret == null
				|| redirectUri == null) {
			throw 'Please make sure that the clientId and redirectUri fields are set';
		}
		Map<String, String> args = new Map<String, String>();
		args['client_id'] = clientId;
		args['client_secret'] = clientSecret;
		args['redirect_uri'] = redirectUri;
		args['grant_type'] = 'authorization_code';
		if(scope != null && scope != '' ) {
			args['scope'] = scope;
		}
		args['code'] = code;
		String jsonString = doPost(UriFactory.GET_ACCESS_TOKEN, args);
		Map userAndToken = JSON.decode(jsonString);
		accessToken = userAndToken['access_token'];
		sessionUser = new User(accessToken, userAndToken['user']);
	}
	
	String get redirectUri => _redirectUri;
				 set redirectUri (String redirectUri ) => _redirectUri = redirectUri;
	String get clientId => _clientId;
				 set clientId (String clientId) => _clientId = clientId;
	String get clientSecret => _clientSecret;
				 set clientSecret (String clientSecret) 
				   => _clientSecret = clientSecret;
	String get accessToken => _accessToken;
				 set accessToken (String token) => _accessToken = token;
	  User get sessionUser => _sessionUser;
	       set sessionUser (User user) => _sessionUser = user;
	String get responseType => _responseType;
				 set responseType (String type) => _responseType = type;	
	String get scope => _scope;
				 set scope (String scope) => _scope = scope;
}