part of dart.instagram_api;

class InstagramModel {
	String _accessToken;
	String _clientId;
	Map _mapModel;
	
	
	
	InstagramModel(this._accessToken, this._mapModel);
	
	String get accessToken => _accessToken;
	       set accessToken (String accessToken) => _accessToken = accessToken;
	Map get jsonModelString  => _mapModel;
	       set jsonModelString (Map jsonModelString) 
				   => _mapModel = jsonModelString;
}