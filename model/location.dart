part of dart.instagram_api;

class Location extends InstagramModel {
	int _id;
	String _name;
	double _longitude;
	double _latitude;
	
		 int get id => _id;
			   set id (int id) => _id = id;
	String get name => _name;
				 set name(String name) => _name = name;
	double get longitude => _longitude;
	       set longitude (double longitude) => _longitude = longitude;
	double get latitude => _latitude;
				 set latitude (double latitude) => _latitude = latitude;
				 
	Location.fromJSON(String jsonString, String accessToken) 
		: super(jsonString, accessToken) {
		Map location = JSON.decode(jsonString);
		id = location['id'];
		name = location['name'];
		longitude = location['longitude'];
		latitude = location['latitude'];
	}
}