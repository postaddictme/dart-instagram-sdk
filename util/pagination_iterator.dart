part of dart.instagram_api;

class PaginationIterator<E> extends Iterator<E> {
	String nextUri;
	String type;
	List<E> list;
	int index = 0;

	PaginationIterator(list, nextUri, type) {
		this.list = list;
		this.nextUri = nextUri;
		this.type = type;
		if (this.list.length == 0 ) fetch();
	}

	bool moveNext() {
		if ( index >= this.list.length - 1 ) {
			return this.fetch();
		}
		print(index);
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

	bool fetch() {
		if (this.isPaginationComplete()) {
			return false;
		}

		String jsonResponse = doGet(nextUri, null);
		Map element = JSON.decode(jsonResponse);
		if (element['pagination'] != null) {
			nextUri = element['pagination']['next_url'];
		} else {
			nextUri = null;
		}
		handleLoad(element['data']);
		return true;
	}

	void handleLoad(List<String> data) {
		switch (type) {
			case 'MEDIA':

				data.forEach( (jsonMedia) {
			   list.add(new Media('', jsonMedia));
			   });
				break;
      case 'USER':
        data.forEach( (jsonMedia) {
        list.add(new User('', jsonMedia));
      });
        break;
		}


	}



	PaginationIterator<E> reset() {
		this.index = 0;
		return this;
	}
}
