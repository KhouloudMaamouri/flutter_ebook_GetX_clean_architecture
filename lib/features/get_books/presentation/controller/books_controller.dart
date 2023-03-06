import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../injection_container.dart';
import '../../../core/status_request.dart';
import '../../../core/usecases/usecase.dart';
import '../../data/models/books_model.dart';
import '../../domain/usecases/get_new_books.dart';

class BooksController extends GetxController {

 var mGetBooks = sl.get<GetBooks>();
 var logger = sl.get<Logger>();
 final TAG = "BooksController";
 StatusRequest statusRequest = StatusRequest.none;
 List<BooksModel> mBooks = [];

 @override
  void onInit() {
    logger.i("$TAG : onInit");
    loadBooks();
    super.onInit();
  }

  loadBooks() async {
    statusRequest = StatusRequest.loading;

     final failureOrNewBooks = await mGetBooks.call(NoParams());

    failureOrNewBooks.fold(
            (failure) => statusRequest = StatusRequest.failure,
            (data) {
              mBooks = data.books;
              statusRequest = StatusRequest.success;
            });

    update();
  }
}