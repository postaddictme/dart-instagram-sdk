part of dart.instagram_api;

class Tag extends InstagramModel {
	String _name;
	int _mediaCount;
	
	
	Tag.fromJSON(String jsonString, String accessToken) 
		: super(jsonString, accessToken) {
		Map tag = JSON.decode(jsonString);
		name = tag['name'];
		mediaCount = tag['media_count'];
	}
	
	
	String get name => _name;
				 set name (String name) => _name = name;	
		 int get mediaCount => _mediaCount;
			   set mediaCount (int mediaCount) => _mediaCount = mediaCount;


}