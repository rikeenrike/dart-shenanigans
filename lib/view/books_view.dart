import 'package:my_project/controllers/books_Controller.dart';
import 'package:my_project/models/books.dart';  


class BooksView {
  final BooksController booksController;

  BooksView(this.booksController);

  void showBooks() {
    for (Books book in booksController.books) {
      print(book);
    }
  }


}