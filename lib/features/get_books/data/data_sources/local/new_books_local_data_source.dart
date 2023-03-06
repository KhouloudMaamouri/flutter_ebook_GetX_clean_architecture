import '../../../../core/error/exceptions.dart';
import '../../models/new_books_model.dart';
import 'books_repository.dart';

abstract class NewBooksLocalDataSource {
  Future<NewBooksModel> getCachedBooks();

  Future<void> cacheNewBooks(NewBooksModel booksToCache);
}

class NewBooksLocalDataSourceImpl implements NewBooksLocalDataSource {
  final NewBooksRepository repository;

  NewBooksLocalDataSourceImpl({required this.repository});

  @override
  Future<void> cacheNewBooks(NewBooksModel booksToCache) async {
    repository.insert(booksToCache);
  }

  @override
  Future<NewBooksModel> getCachedBooks() {
    final cachedBooks = repository.get();
    if (cachedBooks != null) {
      return Future.value(cachedBooks);
    } else {
      throw CacheException();
    }
  }
}
