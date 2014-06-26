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
				 
				 
  /* User endpoints from http://instagram.com/developer/endpoints/users/ 	*/
	
	/* Get basic information about a user. */
	User getUserById(int userId) {
		Map<String, String> data = new Map<String, String>();
		data['user_id'] = userId.toString();
		String uri = UriConstructor.constructUri(UriFactory.USER_GET_DATA, data);
		data.clear();
		data['access_token'] = accessToken;
		String jsonUser = doGet(uri, data);
		Map request = JSON.decode(jsonUser);
		User user = new User(accessToken, request['data']);
	  return user;
	}
	
	/* Search for a user by name */
	List<User> searchUserByName(String username) {
		Map<String, String> data = new Map<String, String>();
		data['q'] = username;
		data['access_token'] = accessToken;
		String uri = UriConstructor.constructUri(UriFactory.USER_SEARCH_USER_BY_NAME, data);
		String jsonUsers = doGet(uri, data);
		Map request = JSON.decode(jsonUsers);
		
		List<User> users = new List<User>();
		request['data'].forEach((jsonUser) {
			users.add(new User(accessToken, jsonUser));
		});
		return(users);
	}
	
	/* See the authenticated user's feed. May return a mix of both image and video types. */
	PaginatedCollection<Media> getSelfFeed() {
		
	}
	
	
	PaginatedCollection<Media> getRecentPublishedMedia(int userId) {
		Map<String, String> data = new Map<String, String>();
		data['user_id'] = userId.toString();
		String uri = UriConstructor.constructUri(UriFactory.USER_GET_RECENT_MEDIA, data);
		data.clear();
    List<Media> medias = new List<Media>();
		PaginationIterator<Media> iterator =  
				new PaginationIterator<Media>(medias, uri+'?access_token='+accessToken, ModelType.MEDIA);

    return new PaginatedCollection<Media>(medias, iterator);
	}
}
// 193886659.1fb234f.f25f2aa534834fd48f6b4965ab424b7c 