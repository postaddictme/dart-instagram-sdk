part of dart.instagram_api;

class InstagramSession {
	String _accessToken;
	User _currentUser;
	String _clientId;
	
	InstagramSession(this._accessToken);
	
	String get accessToken => _accessToken;
				 set accessToken (String token) => _accessToken = token;
		User get currentUser => _currentUser;
				 set currentUser (User user) => _currentUser = user;
	String get clientId => _clientId;
				 set clientId (String id) => _clientId = id;
				 
	User getUserById(int userId) {
		Map<String, String> data = new Map<String, String>();
		data['user_id'] = userId.toString();
		String uri = UriConstructor.constructUri(UriFactory.USER_GET_DATA, data);
		data.clear();
		data['access_token'] = accessToken;
		String jsonUser = doGet(uri, data);
		//print(jsonUser);
		Map request = JSON.decode(jsonUser);
		User user = new User.fromJSON(accessToken, jsonUser);
		//print(user.mediaCount);
		return user;
	}
	
	
}
// 193886659.1fb234f.f25f2aa534834fd48f6b4965ab424b7c 