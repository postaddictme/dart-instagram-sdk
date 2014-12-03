part of dart.instagram_api;

class UriFactory {
	static const String API_ROOT = 'https://api.instagram.com/v1';

	/* User */
	static final String USER_GET_DATA = API_ROOT + '/users/{user_id}';
	static final String USER_GET_SELF_FEED = API_ROOT + '/users/self/feed';
	static final String USER_GET_RECENT_MEDIA = API_ROOT + '/users/{user_id}/media/recent';
	static final String USER_GET_LIKED_MEDIA = API_ROOT + '/users/self/media/liked';
	static final String USER_SEARCH_USER_BY_NAME = API_ROOT + '/users/search';

	/* Relationships */
	static final String RELATIONSHIP_GET_FOLLOWS =
		API_ROOT + "/users/{user_id}/follows";
	static final String RELATIONSHIP_GET_FOLLOWERS =
		API_ROOT + "/users/{user_id}/followed-by";
	static final String RELATIONSHIP_GET_FOLLOW_REQUESTS =
		API_ROOT + "/users/self/requested-by";
	static final String RELATIONSHIP_GET_RELATIONSHIP_STATUS =
		API_ROOT + "/users/{user_id}/relationship";
	static final String RELATIONSHIP_MUTATE_RELATIONSHIP =
		API_ROOT + "/users/{user_id}/relationship";

	/* Media */
		static final String MEDIA_GET = API_ROOT + "/media/{media_id}";
		static final String MEDIA_SEARCH = API_ROOT + "/media/search";
		static final String MEDIA_GET_POPULAR = API_ROOT + "/media/popular";


	/* Comments */
	static final String GET_MEDIA_COMMENTS = API_ROOT + "/media/{media_id}/comments";
	static final String POST_MEDIA_COMMENT = API_ROOT + "/media/{media_id}/comments";
	static final String DELETE_MEDIA_COMMENT = API_ROOT + "/media/{media_id}/comments/{comment_id}";


	/* Likes */
	static final String GET_LIKERS = API_ROOT + "/media/{media_id}/likes";
	static final String SET_LIKE = API_ROOT + "/media/{media_id}/likes";
	static final String REMOVE_LIKE = API_ROOT + "/media/{media_id}/likes";

	/* Tags */
	static final String GET_TAG = API_ROOT + "/tags/{tag_name}";
	static final String GET_RECENT_TAGED_MEDIA = API_ROOT + "/tags/{tag_name}/media/recent";
	static final String SEARCH_TAGS = API_ROOT + "/tags/search";

	/* Locations */
		static final String GET_LOCATION = API_ROOT + "/locations/{location_id}";
		static final String GET_MEDIA_FROM_LOCATION = API_ROOT + "/locations/{location_id}/media/recent";
		static final String SEARCH_LOCATIONS = API_ROOT + "/locations/search";

	/* Auth */
	static final String USER_AUTHORIZATION
	= "https://api.instagram.com/oauth/authorize/?client_id={client_id}&redirect_uri={redirect_uri}&response_type={response_type}&scope={scope}";
	static final String GET_ACCESS_TOKEN = "https://api.instagram.com/oauth/access_token";

	/* Geography */
	static final String GEOGRAPHY_GET = API_ROOT + "/geographies/geo-id/media/recent";
}