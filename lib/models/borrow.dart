import 'books.dart';
import 'users.dart';

class Borrow {  

  User borrower;
  Books book;
  String dateBorrowed;

  Borrow(
    {
      required this.borrower, 
      required this.book
    }
    ) : dateBorrowed = DateTime.now().toString();

  @override
  String toString() {
    return 'Borrower: ${borrower.name}\nBook: ${book.title}\nDate Borrowed: $dateBorrowed';
  }

}