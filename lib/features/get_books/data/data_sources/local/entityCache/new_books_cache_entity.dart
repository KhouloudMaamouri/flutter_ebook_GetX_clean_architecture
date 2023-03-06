import 'package:hive/hive.dart';

import 'books_cache_entity.dart';

part 'new_books_cache_entity.g.dart';

@HiveType(typeId: 1)
class NewBooksCacheEntity extends HiveObject {

  @HiveField(0)
  final String total;
  @HiveField(1)
  final List<BooksCacheEntity> books;

  NewBooksCacheEntity({
    required this.total,
    required this.books
  });

}