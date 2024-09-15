import 'package:my_project/view/users_view.dart';
import 'package:riverpod/riverpod.dart';
import 'package:my_project/models/borrow.dart';
import 'package:my_project/models/books.dart'; 
import 'package:my_project/models/users.dart';
import 'package:my_project/controllers/users_controller.dart';
import 'package:my_project/controllers/books_controller.dart';

class BorrowsController {
  final Ref container;
  final List<Borrow> _borrows = [];
  final usersControllerProvider = Provider((ref) => UsersController(ref));
  final booksControllerProvider = Provider((ref) => BooksController(ref));


  BorrowsController(this.container);

void addBorrow({required String bookTitle, required String userName}) {
  final booksController = container.read(booksControllerProvider);
  final usersController = container.read(usersControllerProvider);

  // Retrieve the User object
  final user = usersController.users.firstWhere(
    (user) => user.name == userName,
    orElse: () => User(name: 'NotFound', age: 0), // Default value indicating not found
  );

  // Retrieve the Books object
  final book = booksController.books.firstWhere(
    (book) => book.title == bookTitle,
    orElse: () => Books(title: 'NotFound', author: '', genre: ''), // Default value indicating not found
  );

  if (user.name == 'NotFound') {
    print('User does not exist');
    return;
  }

  if (book.title == 'NotFound') {
    print('Book does not exist');
    return;
  }

  // Check if the book is already borrowed
  for (final borrow in _borrows) {
    if (borrow.book.title == book.title) {
      print("Book is already borrowed");
      return;
    }
  }

  final Borrow newBorrow = Borrow(book: book, borrower: user);
  _borrows.add(newBorrow);
  print("Borrow added: $newBorrow");
}

  void removeBorrow({required String title}) {
    final int index = _borrows.indexWhere((borrow) => borrow.book.title == title);
    if (index != -1) {
      final Borrow borrow = _borrows.removeAt(index);
      print("Borrow removed: ${borrow.book.title}");
    } else {
      print("Borrow not found");
    }
  }

  void showBorrows() {
    if (_borrows.isEmpty) {
      print("No borrows found");
    } else {
      for (final borrow in _borrows) {
        print(borrow);
      }
    }
  }
}