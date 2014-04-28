part of dart.instagram_api;

class User extends InstagramModel {
	int _id;
	String _userName;
	String _fullName;
	String _profilePictureUri;
	String _bio;
	String _website;
	int _mediaCount;
	int _followerCount;
	int _followingCount;
	
	
	User.fromJSON(String accessToken, String jsonString) 
		: super( accessToken, jsonString) {
		
		Map user = JSON.decode(jsonString);
		id = int.parse(user['data']['id']);
		userName = user['data']['username'];
		fullName = user['data']['full_name'];
		profilePictureUri = user['data']['profile_picture'];
		bio = user['data']['bio'];
		website = user['data']['website'];
		
		Map counts = user['data']['counts'];
		mediaCount = counts['media'];
		followerCount = counts['followed_by'];
		followingCount = counts['follows'];
	
	}
	
		 int get id => _id;
			   set id(int id) => _id = id;
	String get userName => _userName;
	       set userName(String userName) => _userName = userName;
	String get fullName => _fullName;
	       set fullName(String fullName) => _fullName = fullName;
	String get profilePictureUri => _profilePictureUri;
				 set profilePictureUri(String profilePictureUrl) 
				 	 => _profilePictureUri = profilePictureUrl;
	String get bio => _bio;
	       set bio(String bio) => _bio = bio;
	String get website => _website;
	       set website(String website) => _website = website;
	   int get mediaCount => _mediaCount;
	       set mediaCount(int mediaCount) => _mediaCount = mediaCount;
		 int get followerCount => _followerCount;
		     set followerCount(int followerCount) => _followerCount = followerCount;
		 int get followingCount => _followingCount;
		     set followingCount(int followingCount) 
				   => _followingCount = followingCount;
}