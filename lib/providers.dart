import 'package:riverpod/riverpod.dart';

import 'package:my_project/controllers/users_controller.dart';
import 'package:my_project/controllers/books_Controller.dart';
import 'package:my_project/controllers/borrows_Controller.dart';

import 'package:my_project/view/books_view.dart';
import 'package:my_project/view/users_view.dart';

final usersControllerProvider = Provider((ref) => UsersController(ref));
final usersViewProvider =
    Provider((ref) => UsersView(ref.read(usersControllerProvider)));
final booksControllerProvider = Provider((ref) => BooksController(ref));
final booksViewProvider =
    Provider((ref) => BooksView(ref.read(booksControllerProvider)));
final borrowsControllerProvider = Provider((ref) => BorrowsController(ref));

final container = ProviderContainer();

final usersController = container.read(usersControllerProvider);
final usersView = container.read(usersViewProvider);
final booksController = container.read(booksControllerProvider);
final booksView = container.read(booksViewProvider);
final borrowsController = container.read(borrowsControllerProvider);