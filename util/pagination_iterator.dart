part of dart.instagram_api;

class PaginationIterator<E> extends Iterator<E> {
	String nextUri;
	List<E> list;
	int index = 0;
	
	PaginationIterator(list, nextUri) {
		this.list = list;
		this.nextUri = nextUri;
		if (this.list.length == 0 ) fetch();
	}
	
	bool moveNext() {
		if ( index >= this.list.length - 1 ) {
			this.fetch();
		}
		index++;
		return true;
	}
	
	E get current {
  		return this.list[index];
  }
	
	bool isPaginationComplete() {
		if (nextUri == null || nextUri == '') return true;
		else return false;
	}
	
	void fetch() {
		if (this.isPaginationComplete()) {
			return;
		}
		
		String jsonResponse = doGet(nextUri, null);
		Map element = JSON.decode(jsonResponse);
		if (element['pagination'] != null) {
			nextUri = element['pagination']['next_url'];
		}
		handleLoad(element['data']);
	}
	
	void handleLoad(mediaItems) {
		for (var mediaItem in mediaItems) {
			list.add(new Media('', mediaItem));
		}					
	}
	
	PaginationIterator<E> reset() {
		this.index = 0;
		return this;
	}
	
	
	
}