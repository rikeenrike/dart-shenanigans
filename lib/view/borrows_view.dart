import 'package:my_project/controllers/borrows_Controller.dart';
import 'package:my_project/models/borrow.dart';

class BorrowsView {
  final BorrowsController borrowsController;

  BorrowsView(this.borrowsController);

  void showBorrows() {
    for (Borrow borrow in borrowsController.borrows) {
      print(borrow);
    }
  }
}