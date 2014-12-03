part of dart.instagram_api;

class Comment extends InstagramModel {

	DateTime _createdTime;
	String _text;
	User _sender;
	String _id;
	
	Comment(String accessToken, Map comment) 
	: super(accessToken, comment) {
		createdTime = 
				new DateTime.fromMillisecondsSinceEpoch(
							int.parse(comment['created_time'])
						);
		text = comment['text'];
		sender = new User(accessToken, comment['from']);
		id = comment['id'];
	}
	
	DateTime get createdTime => _createdTime;
		       set createdTime(DateTime createdTime) 
		       		=> _createdTime = createdTime;
		String get text => _text;
					 set text(String text) => _text= text;
			User get sender => _sender;
					 set sender(User sender) => _sender = sender;
		String get id => _id;
					 set id(String id) => _id = id;
}

