import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/features/get_books/presentation/controller/books_controller.dart';
import '../../../core/handling_data_view.dart';
import '../widgets/book_card.dart';

class Books extends StatelessWidget {
  const Books({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BooksController mBooksController = Get.put(BooksController());

    return SafeArea(
        child: Scaffold(
            body: GetBuilder<BooksController>(
                builder: ((controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    padding: EdgeInsets.only(left: 0.0,bottom: 0.0,right: 0.0,top: 2),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children:
                      List.generate(
                          controller.mBooks.length,
                              (index) => BookCard(
                              image: controller.mBooks[index].image,
                              title: controller.mBooks[index].title,
                              isbn13: controller.mBooks[index].isbn13,
                              subtitle: controller.mBooks[index].subtitle,
                              press: () => {
                                print("OnClick Book ${controller.mBooks[index].title}")
                              })),
                    ),
                  ),
                )
                )
            )
        )
    );
  }
}
