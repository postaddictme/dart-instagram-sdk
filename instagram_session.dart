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

  /* See the authenticated user's feed. May return a mix of both image and video types. */
  PaginatedCollection<Media> getUserSelfFeed() {
    String uri = UriFactory.USER_GET_SELF_FEED;
    List<Media> medias = new List<Media>();
    PaginationIterator<Media> iterator =
            new PaginationIterator<Media>(medias, uri+'?access_token='+accessToken, ModelType.MEDIA);
    return new PaginatedCollection<Media>(medias, iterator);
  }


  /* Get the most recent media published by a user. May return a mix of both image and video types.  */
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

  /*
   * See the authenticated user's list of media they've liked. May return a mix of both image and video types.
   * Note: This list is ordered by the order in which the user liked the media.
   * Private media is returned as long as the authenticated user has permission to view that media.
   * Liked media lists are only available for the currently authenticated user.
   */
  PaginatedCollection<Media> getUserLikedMedia() {
    String uri = UriFactory.USER_GET_LIKED_MEDIA;
    List<Media> medias = new List<Media>();
    PaginationIterator<Media> iterator =
        new PaginationIterator<Media>(medias, uri+'?access_token='+accessToken, ModelType.MEDIA);

    return new PaginatedCollection<Media>(medias, iterator);
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


  /* Relationship Endpoints from http://instagram.com/developer/endpoints/relationships  */


	/* Get the list of users this user follows. */
	PaginatedCollection<User> getUserFollows(int userId) {
    Map<String, String> data = new Map<String, String>();
    data['user_id'] = userId.toString();
    String uri = UriConstructor.constructUri(UriFactory.RELATIONSHIP_GET_FOLLOWS, data);
    data.clear();
    List<User> users = new List<User>();
    PaginationIterator<User> iterator =
        new PaginationIterator<User>(users, uri+'?access_token='+accessToken, ModelType.USER);

    return new PaginatedCollection<User>(users, iterator);
	}

	/* Get the list of users this user is followed by.  */
	PaginatedCollection<User> getUserFollowedBy(int userId) {
     Map<String, String> data = new Map<String, String>();
     data['user_id'] = userId.toString();
     String uri = UriConstructor.constructUri(UriFactory.RELATIONSHIP_GET_FOLLOWERS, data);
     data.clear();
     List<User> users = new List<User>();
     PaginationIterator<User> iterator =
         new PaginationIterator<User>(users, uri+'?access_token='+accessToken, ModelType.USER);

     return new PaginatedCollection<User>(users, iterator);
   }

	/* List the users who have requested this user's permission to follow. */
	PaginatedCollection<User> getUserRequestedBy(int userId) {
    Map<String, String> data = new Map<String, String>();
    data['user_id'] = userId.toString();
    String uri = UriConstructor.constructUri(UriFactory.RELATIONSHIP_GET_FOLLOW_REQUESTS, data);
    data.clear();
    List<User> users = new List<User>();
    PaginationIterator<User> iterator =
        new PaginationIterator<User>(users, uri+'?access_token='+accessToken, ModelType.USER);

    return new PaginatedCollection<User>(users, iterator);
	}

	/* Get information about a relationship to another user. */
	 Relationship getUserRelationship(int userId) {
     Map<String, String> data = new Map<String, String>();
     data['user_id'] = userId.toString();
     String uri = UriConstructor.constructUri(UriFactory.RELATIONSHIP_GET_RELATIONSHIP_STATUS, data);
     data.clear();
     data['access_token'] = accessToken;
     String jsonRelationship = doGet(uri, data);
     Map request = JSON.decode(jsonRelationship);
     Relationship relationship = new Relationship(accessToken, request['data']);

     return relationship;
   }

	 /* Modify the relationship between the current user and the target user. */
	 Relationship modifyRelation(int userId, String relationshipStatus) {
     Map<String, String> data = new Map<String, String>();
     data['user_id'] = userId.toString();
     String uri = UriConstructor.constructUri(UriFactory.RELATIONSHIP_GET_RELATIONSHIP_STATUS, data);
     data.clear();
     data['access_token'] = accessToken;
     uri = UriConstructor.uriFromMap(uri, data);
     data.clear();
     data['action'] = relationshipStatus;
     String jsonRelationship = doPost(uri, data);
     Map request = JSON.decode(jsonRelationship);
     Relationship relationship = new Relationship(accessToken, request['data']);
     return relationship;

	 }

	  /* Media Endpoints from http://instagram.com/developer/endpoints/media  */

	 /*
	  * Get information about a media object. The returned type key will allow you to differentiate between image and video media.
	  * Note: if you authenticate with an OAuth Token, you will receive the user_has_liked key
	  * which quickly tells you whether the current user has liked this media item.
	  */
	 Media getMediaById(int mediaId) {
	   Map<String, String> data = new Map<String, String>();
     data['media_id'] = mediaId.toString();
     String uri = UriConstructor.constructUri(UriFactory.MEDIA_GET_BY_ID, data);
     data.clear();
     data['access_token'] = accessToken;
     String jsonUser = doGet(uri, data);
     Map request = JSON.decode(jsonUser);
     Media media = new Media(accessToken, request['data']);
     return media;
	 }

	 /*
	  * This endpoint returns the same response as GET /media/media-id.
	  * A media object's shortcode can be found in its shortlink URL.
	  * An example shortlink is http://instagram.com/p/D/
	  * Its corresponding shortcode is D.
	  */
	 Media getMediaByShortcode(String shortcode) {
     Map<String, String> data = new Map<String, String>();
     data['shortcode'] = shortcode.toString();
     String uri = UriConstructor.constructUri(UriFactory.MEDIA_GET_BY_SHORCODE, data);
     data.clear();
     data['access_token'] = accessToken;
     String jsonUser = doGet(uri, data);
     Map request = JSON.decode(jsonUser);
     Media media = new Media(accessToken, request['data']);
     return media;
	 }
	 /* Search for media in a given area. The default time span is set to 5 days.
	  * The time span must not exceed 7 days.
	  * Defaults time stamps cover the last 5 days. Can return mix of image and video types.
	  *
	  */
	  PaginatedCollection<Media> searchMedia(double lat, double lng, int minTimestamp, int maxTimestamp, int distance) {
     String uri = UriFactory.MEDIA_SEARCH;
     Map<String, String> params = new Map<String, String>();
     params['lat'] = lat.toString();
     params['lng'] = lng.toString();
     params['min_timestamp'] = minTimestamp.toString();
     params['max_timestamp'] = maxTimestamp.toString();
     params['distance'] = distance.toString();
     params['access_token'] = accessToken;
     List<Media> medias = new List<Media>();
     PaginationIterator<Media> iterator =
             new PaginationIterator<Media>(medias, UriConstructor.uriFromMap(uri, params), ModelType.MEDIA);
     return new PaginatedCollection<Media>(medias, iterator);
   }


	  /* Get a list of what media is most popular at the moment. Can return mix of image and video types. */
	  PaginatedCollection<Media> getPopular() {
      String uri = UriFactory.MEDIA_GET_POPULAR;
      List<Media> medias = new List<Media>();
      PaginationIterator<Media> iterator =
          new PaginationIterator<Media>(medias, uri+'?access_token='+accessToken, ModelType.MEDIA);

      return new PaginatedCollection<Media>(medias, iterator);
    }




}
// 193886659.1fb234f.f25f2aa534834fd48f6b4965ab424b7c