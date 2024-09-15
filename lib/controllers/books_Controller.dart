import 'package:riverpod/riverpod.dart';
import 'package:my_project/models/books.dart';

class BooksController {
  final Ref container;
  final List<Books> _books = [];

  List<Books> get books => _books;

  BooksController(this.container);

  void addBook({required String title, required String author, required String genre}) {
    final Books newBook = Books(title: title, author: author, genre: genre);
    _books.add(newBook);
    print("Book added: $newBook");
  }

  void removeBook({required String title}) {
    final int index = _books.indexWhere((book) => book.title == title);
    if (index != -1) {
      final Books book = _books.removeAt(index);
      print("Book removed: ${book.title}");
    } else {
      print("Book not found");
    }
  }

  void updateBook({required String title, required String newTitle, required String author, required String genre}) {
    final int index = _books.indexWhere((book) => book.title == title);
    if (index != -1) {
      _books[index] = Books(title: newTitle, author: author, genre: genre);
      print("Book updated: ${_books[index]}");
    } else {
      print("Book not found");
    }
  }

}