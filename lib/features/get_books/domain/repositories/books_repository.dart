import 'package:dartz/dartz.dart';
import '../../../core/error/Failures.dart';
import '../../data/models/new_books_model.dart';

abstract class BooksRepository {
  Future<Either<Failure, NewBooksModel>> getNewBooks();
}