part of dart.instagram_api;

String doPost(String url, Map<String, String> data) {
	var futureRequest = HttpRequest.postFormData(url, data);
	String responseText;
	void onDataLoaded(String responseTextTemp) {
		responseText = responseTextTemp;
	}
	HttpRequest request = futureRequest.then(onDataLoaded);
	return responseText;
}

Future doGet(String url, Map<String, String> data) {
	
	if ( data != null ) {
		String getData = '?';
		data.forEach((key,value) { getData += '$key=$value&'; });
		url += getData;
	}
	
  String responseText;
	var req = new HttpRequest();
//  req.open('GET', url, async: false);
//  req.onLoadEnd.listen((event) => 
//  		responseText = event.target.responseText
//  		);
//  req.send();
	Future future = HttpRequest.getString(url);

	return future;
}

