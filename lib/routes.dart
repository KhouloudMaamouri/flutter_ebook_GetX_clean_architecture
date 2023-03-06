import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx/app_routes.dart';
import 'features/get_books/presentation/page/books.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.books, page: () => const Books())
];