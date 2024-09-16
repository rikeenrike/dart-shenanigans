import 'package:my_project/controllers/users_controller.dart';
import 'package:my_project/controllers/books_controller.dart';
import 'package:my_project/models/users.dart';
import 'package:my_project/models/books.dart';
import 'package:my_project/models/borrow.dart';
import 'package:riverpod/riverpod.dart';

class BorrowsController {
  final Ref container;
  final List<Borrow> _borrows = [];
  List<Borrow> get borrows => _borrows;


final usersControllerProvider = Provider((ref) => UsersController(ref));
final booksControllerProvider = Provider((ref) => BooksController(ref));
  
  BorrowsController(this.container);

  void addBorrow({required Books bookTitle, required User userName}) {

    final Borrow newBorrow = Borrow(book: bookTitle, borrower: userName);
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
      print("Book: ${borrow.book.title}, Borrower: ${borrow.borrower.name}");
    }
 
  }
}
}

