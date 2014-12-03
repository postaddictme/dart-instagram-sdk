part of dart.instagram_api;

String doPost(String url, Map<String, String> data) {
    String responseText;
    var req = new HttpRequest();
    req.open('POST', url, async: false);
    req.onLoadEnd.listen((event) =>
        responseText = event.target.responseText
        );
    req.setRequestHeader("content-Type", "application/json");
    String params = '';
    data.forEach((key, value){
      params=key+'='+value;
    });
    req.send(params);
    return responseText;

}

String doGet(String url, Map<String, String> data) {

	if ( data != null ) {
		String getData = '?';
		data.forEach((key,value) { getData += '$key=$value&'; });
		url += getData;
	}

  String responseText;
	var req = new HttpRequest();
  req.open('GET', url, async: false);
  req.onLoadEnd.listen((event) =>
  		responseText = event.target.responseText
  		);
  req.send();
	return responseText;
}

