part of dart.instagram_api;

class PaginatedCollection<E> {
	List<E> _list;
	PaginationIterator<E> _iterator;
	
	PaginatedCollection(this._list, this._iterator);
	
	PaginationIterator<E> iterator() {
		return _iterator.reset();
	}
	
	int size() {
		return list.length;
	}
	
	E get(int index) {
		return list.elementAt(index);
	}
	
	List<E> get list => _list;
					set list (List<E> list ) => _list = list;
	
}