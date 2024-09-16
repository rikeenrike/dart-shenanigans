import 'package:riverpod/riverpod.dart';
import 'package:my_project/models/users.dart';

class UsersController {
  final Ref container;
  final List<User> _users = [];
  List<User> get users => _users;

  UsersController(this.container);

  void addUser({required String name, required int age}) {
    final User newUser = User(name: name, age: age);
    _users.add(newUser);
    print("User added: $newUser");
    print(_users);
    // print("User added: $newUser");
  }

  void removeUser({required String name}) {
    final int index = _users.indexWhere((user) => user.name == name);
    if (index != -1) {
      final User user = _users.removeAt(index);
      // print("User removed: ${user.name}");
    } else {
      // print("User not found");
    }
  }

  void updateUser({required String name, required String updatedname, required int age}) {
    final int index = _users.indexWhere((user) => user.name == name);
    if (index != -1) {
      _users[index] = User(name: updatedname, age: age);
      // print("User updated: ${_users[index]}");
    } else {
      // print("User not found");
    }
  }

  User ? findUserByName(String name) {
    for (final user in _users) {
      if (user.name == name) {
        return user;
      }
    }
    return null;
  }


}