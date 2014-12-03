part of dart.instagram_api;

class OutgoingStatus {
	static const String FOLLOWS = 'follows';
	static const String REQUESTED = 'requested';
	static const String NONE = 'none';
}

class IncomingStatus {
	static const String FOLLOWED_BY = 'followed_by';
	static const String REQUESTED_BY = 'requested_by';
	static const String BLOCKED_BY_YOU = 'blocked_by_you';
	static const String NONE = 'none';
}

class ModifyStatus {
  static const String ACTION_FOLLOW = 'follow';
  static const String ACTION_UNFOLLOW = 'unfollow';
  static const String ACTION_BLOCK = 'block';
  static const String ACTION_UNBLOCK = 'unblock';
  static const String ACTION_APPROVE = 'approve';
  static const String ACTION_IGNORE = 'ignore';
}

class Relationship extends InstagramModel {
	String _outgoingStatus;
	String _incomingStatus;
	bool _targetUserIsPrivate;

	Relationship(String accessToken, Map relationship)
      : super (accessToken, relationship) {
		outgoingStatus = relationship['outgoing_status'];
		incomingStatus = relationship['incoming_status'];
		targetUserIsPrivate = relationship['target_user_is_private'];
	}

	String get outgoingStatus => _outgoingStatus;
				 set outgoingStatus (String outgoingStatus)
				 	=> _outgoingStatus = outgoingStatus;
	String get incomingStatus => _incomingStatus;
				 set incomingStatus (String incomingStatus)
				 	=> _incomingStatus = incomingStatus;
		bool get targetUserIsPrivate => _targetUserIsPrivate;
			   set targetUserIsPrivate (bool targetUserIsPrivate)
				  => _targetUserIsPrivate = targetUserIsPrivate;
}