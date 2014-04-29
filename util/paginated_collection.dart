part of dart.instagram_api;

class PaginatedCollection<E> {
	List<E> list;
	PaginationIterator<E> iterator;
	PaginatedCollection(List<E> list, PaginationIterator<E> iterator) {
		this.list = list;
		this.iterator = iterator;
	}	
}