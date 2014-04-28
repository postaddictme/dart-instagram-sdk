part of dart.instagram_api;

class Media extends InstagramModel {

UriConstructor uriConstructor;

	/** 
	 * Type of Media
	 */
	String _type;
	
	/**
	 * users tagged in this media
	 */
	Set<UserTaggedInMedia> _usersInMedia;
	
	
	/** 
	 * The media filter
	 */
	String _filter;
	
	
	/**
	 * List of Comment objects for this media
	 */
	List<Comment> _comments;
	
	/**
	 * Count of comments
	 */
	int _commentCount;
	
	/** 
	 * List of tags used in this media
	 */
	List<String> _tags;
	
	/**
	 * List of users who liked the media
	 */
	List<User> _likers;
	
	/**
	 * Count of likes
	 */
	int _likesCount;
	
	/** 
	 * The link for this media
	 */
	String _link;
	
	/**
	 * User who created this media
	 */
	User _user;
	
	/**
	 * The creation time
	 */
	DateTime _createdTime;
	
	/**
	 * Low resolution image of this media
	 */
	ImageSource _lowResoltionImageSource;
	
	/**
	 * Thumbnail resolution image of this media
	 */
	ImageSource _thumbnailResolutionImageSource;
	
	/**
	 * Standard resoltuion image of this media
	 */
	ImageSource _standardResoltuionImageSource;
	
	/**
	 * Id of this media as String
	 */
	String _id;
	
	Location _location;
	
	Comment _caption;
	
	bool _userHasLiked;
	
	
	
	Media.fromJSON(String accessToken, String jsonString) 
		: super(accessToken, jsonString) {
	
	uriConstructor = new UriConstructor(null, null);
	
		Map media = JSON.decode(jsonString);
		type = media['type'];
		
		if (media['users_in_photo'] != null) {
			List<Map> usersInPhotoFromJson = media['users_in_photo'];
			Set<UserTaggedInMedia> usersInPhotoTemp = new Set<UserTaggedInMedia>();
			addToSetUsersInMedia(element) {
				usersInPhotoTemp.add(new UserTaggedInMedia.fromJSON(element, accessToken));
			}
			usersInPhotoFromJson.forEach(addToSetUsersInMedia);
			usersInPhoto = usersInPhotoTemp;
		}
		
		filter = media['filter'];
		tags = media['tags'];
		link = media['link'];
		user = new User.fromJSON( accessToken, JSON.encode(media['user']));
		createdTime = new DateTime.fromMillisecondsSinceEpoch(
				int.parse((media['created_time'])));
		
		Map images = media['images'];
		lowResoltionImageSource = 
			new ImageSource.fromJSON(accessToken, JSON.encode(images['low_resolution']));
		thumbnailResolutionImageSource = 
			new ImageSource.fromJSON(accessToken, JSON.encode(images['thumbnail']));
		standardResoltuionImageSource = 
			new ImageSource.fromJSON(accessToken, JSON.encode(images['standard_resolution']));
		
		id = media['id'];
		
		if (media['location'] != null) {
			location = new Location.fromJSON(media['location'], accessToken);
		}
		if (media['caption'] != null) {
			caption = new Comment.fromJSON(accessToken, media['caption']);
		}
		if (media['user_has_liked'] != null) {
			userHasLiked = media['user_has_liked'];
		}
		
		Map commentsJson = media['comments'];
		commentCount = commentsJson['count'];
		if (commentsJson['data']!=null) {
			List data = commentsJson['data'];
			comments = new List<Comment>();
			data.forEach( (element)
			  => comments.add(new Comment.fromJSON(element, accessToken)));
		}
		
		Map likesJson = media['likes'];
		likesCount = media['count'];
		if ( likesJson['data']!= null ) {
			List data = likesJson['data'];
			likers = new List<User>();
			data.forEach((element) 
			  => likers.add(new User.fromJSON(element, accessToken)) );
		}
	}
	
	Media getMedia (String accessToken,String jsonString) {
		Map media = JSON.decode(jsonString);
		if (media['type'] == 'image') {
			return new ImageMedia.fromJSON(jsonString, accessToken);
		} else {
			return new VideoMedia.fromJSON(jsonString, accessToken);
		}
	}
	
	void refreshComments() {
		Map<String, String> map = new Map<String, String>();
		map['media_id'] = id;
		String uri = UriConstructor.constructUri(UriFactory.GET_MEDIA_COMMENTS, map);
		map.clear();
		map['access_token'] = accessToken;
		
		Map responseJson = JSON.decode(doGet(uri, map));
		if (responseJson['meta']['code'] == 200) {
			List data = responseJson['data'];
			comments.clear();
			data.forEach( (element) 
				=> comments.add(new Comment.fromJSON(element, accessToken)));
			commentCount = comments.length;
		}
	}
	
	void refreshLikes() {
		Map<String, String> map = new Map<String, String>();
		map['media_id'] = id;
		String uri = UriConstructor.constructUri(UriFactory.GET_LIKERS, map);
		map.clear();
		map['access_token'] = accessToken;
		Map responseJson = JSON.decode(doGet(uri, map));
		if (responseJson['meta']['code'] == 200) {
			List data = responseJson['data'];
			likers.clear();
			likers = new List<User>();
			data.forEach((element) 
			  => likers.add(new User.fromJSON(element, accessToken)) );
			likesCount = likers.length;
		}
	}
	
									String get type => _type;
												 set type (String type) => _type = type;
	Set<UserTaggedInMedia> get usersInMedia => _usersInMedia;
											   set usersInPhoto (Set<UserTaggedInMedia> usersInMedia)
												   => _usersInMedia = usersInMedia;
									String get filter => _filter;
												 set filter (String filter) => _filter = filter;
					 List<Comment> get comments => _comments;
					 							 set comments(List<Comment> comments)
					 							   => _comments = comments;
										 int get commentCount => _commentCount;
												 set commentCount (int commentCount)
												 	 => _commentCount = commentCount;
						List<String> get tags => _tags;
												 set tags (List<String> tags) => _tags = tags;
							List<User> get likers => _likers;
												 set likers (List<User> likers) => _likers = likers;
										 int get likesCount => _likesCount;
											   set likesCount (int likesCount)
												 	=> _likesCount = likesCount;
									String get link => _link;
									       set link (String link) => _link = link;
										User get user => _user;
												 set user (User user) => _user = user;
								DateTime get createdTime => _createdTime;
							 	         set createdTime (DateTime createdTime) 
												 	=> _createdTime = createdTime;
					   ImageSource get lowResoltionImageSource 
							             => _lowResoltionImageSource;
									       set lowResoltionImageSource (ImageSource lowResoltionImageSource)
									         => _lowResoltionImageSource = lowResoltionImageSource;
					   ImageSource get thumbnailResolutionImageSource 
	  					             => _thumbnailResolutionImageSource;
									       set thumbnailResolutionImageSource (ImageSource thumbnailResolutionImageSource)
									         => _thumbnailResolutionImageSource = thumbnailResolutionImageSource;	
					   ImageSource get standardResoltuionImageSource 
						               => _standardResoltuionImageSource;
									       set standardResoltuionImageSource (ImageSource standardResoltuionImageSource)
									         => _standardResoltuionImageSource = standardResoltuionImageSource;
									String get id => _id;
												 set id (String id) => _id = id;
								Location get location => _location;
												 set location (Location location) => _location = location;
							   Comment get caption => _caption;
								         set caption (Comment caption) => _caption = caption;
									  bool get userHasLiked => _userHasLiked;
												 set userHasLiked (bool userHasLiked) 
												 	 => _userHasLiked = userHasLiked;
												 

}

class VideoMedia extends Media {
/**
 * Low resolution video
 */
	VideoSource _lowResolutionVideoSource;

/**
 * Standard resolution video
 */
	VideoSource _standardResolutionVideoSource;

/**
 * Set of users tagged in photo
 */
 	VideoMedia.fromJSON(String accessToken, String jsonString )
      : super.fromJSON(accessToken, jsonString) {
 		Map media = JSON.decode(jsonString);
 		Map video = media['videos'];
 		lowResolutionVideoSource = new VideoSource.fromJSON(video['low_resolution'], accessToken);
 		standardResoltuionVideoSource = new VideoSource.fromJSON(video['standard_resolution'], accessToken);
 }

 	VideoSource get lowResolutionVideoSource
  						  => _lowResolutionVideoSource;
 						  set lowResolutionVideoSource(VideoSource source) 
 						    => _lowResolutionVideoSource = source;
	VideoSource get standardResoltuionVideoSource
							  => _standardResolutionVideoSource;
							set standardResoltuionVideoSource (VideoSource source)
							  => _standardResolutionVideoSource = source;
	
}

class ImageMedia extends Media {
	ImageMedia.fromJSON(String accessToken, String jsonString) 
      : super.fromJSON(accessToken, jsonString);

}

class VideoSource extends MediaSource {
	VideoSource.fromJSON(String accessToken, String jsonString) 
		: super.fromJSON(accessToken, jsonString);
}

class ImageSource extends MediaSource {
	ImageSource.fromJSON(String accessToken, String jsonString) 
		: super.fromJSON(accessToken, jsonString);
}

class MediaSource {
	/**
	 * Direct link to video
	 */
	String _uri;
	
	/**
	 * Width of video
	 */
	int _width;
	
	/**
	 * Height of video
	 */
	int _height;
	
	MediaSource.fromJSON(String accessToken, String jsonString) {
		Map image = JSON.decode(jsonString);
		uri = image['url'];
		width = image['width'];
		height = image['height'];
	}
	
	String get uri => _uri;
				 set uri(String uri) => _uri = uri;
	   int get width => _width;
				 set width(int width) => _width = width;
		 int get height => _height;
		     set height (int height) => _height = height;
	
}



class UserTaggedInMedia {
	double _x;
	double _y;
	User _user;
	
	UserTaggedInMedia.fromJSON(String accessToken, String jsonString) {
		Map userInPhoto = JSON.decode(jsonString);
		Map position = userInPhoto['position'];
		x = position['x'];
		y = position['y'];
		user = new User.fromJSON(userInPhoto['user'], accessToken) ;
		
	}
	double get x => _x;
				 set x (double x) => _x = x;
	double get y => _y;
			   set y (double y) => _y = y;
	  User get user => _user;
	       set user (User user) => _user = user;
	
}

class Filter {
	final index;
	const Filter._(this.index);
	static const TOASTER = const Filter._(0);
	static const HUDSON = const Filter._(1);
	static const SIERRA = const Filter._(2);
	static const INKWELL = const Filter._(3);
	static const NORMAL = const Filter._(4);
	static const AMARO = const Filter._(5);
	static const RISE = const Filter._(6);
	static const VALENCIA = const Filter._(7);
	static const NONE = const Filter._(8);
	
	static const values = const<Filter> 
		[TOASTER, HUDSON, SIERRA, INKWELL, NORMAL, AMARO, RISE, VALENCIA, NONE];
}


