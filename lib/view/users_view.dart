import 'package:my_project/models/users.dart';
import 'package:my_project/controllers/users_controller.dart';

class UsersView {
  final UsersController usersController;

  UsersView(this.usersController);

  void showUsers() {
    for (User user in usersController.users) {
      print(user);
    }
  }
}