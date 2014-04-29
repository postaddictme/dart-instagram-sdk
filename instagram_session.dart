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
		User user = new User(accessToken, request['data']);
		return user;
	}
	
	PaginatedCollection<Media> getRecentPublishedMedia(int userId) {
		Map<String, String> data = new Map<String, String>();
		data['user_id'] = userId.toString();
		String uri = UriConstructor.constructUri(UriFactory.USER_GET_RECENT_MEDIA, data);
		data.clear();
    data['access_token'] = accessToken;
    String jsonMedias = doGet(uri, data);
    print(jsonMedias);
    Map mapMedias = JSON.decode(jsonMedias);
    //List<String> jsonMediasList; 
    List<String> mediasJson = mapMedias['data'];
    List<Media> medias = new List<Media>();
		PaginationIterator<Media> iterator =  new PaginationIterator<Media>(medias, uri+'?access_token='+accessToken);
    return new PaginatedCollection<Media>(medias, iterator);
	}
}
// 193886659.1fb234f.f25f2aa534834fd48f6b4965ab424b7c 