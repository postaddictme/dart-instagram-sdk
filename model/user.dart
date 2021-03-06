part of dart.instagram_api;

class User extends InstagramModel {
	
	String _userName;
	String _bio;
	String _website;
	String _profilePictureUri;
	String _fullName;
	int _mediaCount;
	int _followerCount;
	int _followingCount;
	int _id;
	
	User(String accessToken, Map user) 
		: super( accessToken, user) {
		id = int.parse(user['id']);
		userName = user['username'];
		fullName = user['full_name'];
		profilePictureUri = user['profile_picture'];
		bio = user['bio'];
		website = user['website'];
		
		if (user['counts'] != null) {
  		mediaCount = user['counts']['media'];
  		followerCount = user['counts']['followed_by'];
  		followingCount = user['counts']['follows'];
		}
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
		     set followerCount(int followerCount) => 
		    		 _followerCount = followerCount;
		 int get followingCount => _followingCount;
		     set followingCount(int followingCount) 
				   => _followingCount = followingCount;
}