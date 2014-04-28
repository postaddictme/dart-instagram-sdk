part of dart.instagram_api;

class InstagramModel {
	String _accessToken;
	String _clientId;
	String _jsonModelString;
	
	InstagramModel(this._accessToken, this._jsonModelString);
	
	String get accessToken => _accessToken;
	       set accessToken (String accessToken) => _accessToken = accessToken;
	String get jsonModelString  => _jsonModelString;
	       set jsonModelString (String jsonModelString) 
				   => _jsonModelString = jsonModelString;
				 
}