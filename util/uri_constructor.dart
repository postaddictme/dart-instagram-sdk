part of dart.instagram_api;

class UriConstructor {
	String _accessToken;
	String _clientId;
	
	UriConstructor(this._accessToken, this._clientId);
	
	static String constructUri(String uri, Map map) {
		map.forEach((key,value) {uri = uri.replaceAll(new RegExp('{' + key + '}'), value);	});
		return uri;
	}
	
	static String uriFromMap(String uri, Map map) {
		uri += '?';
		map.forEach((key,value) { uri += '$key=$value&'; });
		return uri;
	}
	
	String get accessToken => _accessToken;
				 set accessToken (String token) => _accessToken = token;
	String get clientId => _clientId;
				 set clientId (String clientId) => _clientId = clientId;
}