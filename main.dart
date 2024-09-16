import 'dart:io';
import 'package:my_project/providers.dart';


void main() {
  bool isRunning = true;

  while (isRunning) {
    print('Enter 1 to add a user');
    print('Enter 2 to remove a user');
    print('Enter 3 to update a user');
    print('Enter 4 to show users');
    print('Enter 5 to add a book');
    print('Enter 6 to remove a book');
    print('Enter 7 to update a book');
    print('Enter 8 to show books');
    print('Enter 9 to Borrow a book');
    print('Enter 10 to View borrows');
    print('Enter 0 to exit');

    final input = int.parse(stdin.readLineSync()!);

    switch (input) {
      case 1:
        addUser();
        break;
      case 2:
        removeUser();
        break;
      case 3:
        updateUser();
        break;
      case 4:
        usersView.showUsers();
        break;
      case 5:
        addBook();
        break;
      case 6:
        removeBook();
        break;
      case 7:
        updateBook();
        break;
      case 8:
        booksView.showBooks();
        break;
      case 9:
        print('Enter the name of the user');
        final name = stdin.readLineSync()!;
        print('Enter the title of the book');
        final title = stdin.readLineSync()!;

        borrowsController.addBorrow(bookTitle: title, userName: name);
        break;
      case 10:  
        borrowsController.showBorrows();
        break;
      case 0:
        isRunning = false;
        break;
      default:
        print('Invalid input, please try again.');
    }
  }
}

void addBook() {
  print('Enter the title of the book');
  final title = stdin.readLineSync()!;
  print('Enter the author of the book');
  final author = stdin.readLineSync()!;
  print('Enter the genre of the book');
  final genre = stdin.readLineSync()!;
  booksController.addBook(title: title, author: author, genre: genre);
}

void removeBook() {
  print('Enter the title of the book');
  final title = stdin.readLineSync()!;
  booksController.removeBook(title: title);
}

void updateBook() {
  print('Enter the title of the book');
  final title = stdin.readLineSync()!;
  print('Enter the updated title of the book');
  final newTitle = stdin.readLineSync()!;
  print('Enter the author of the book');
  final author = stdin.readLineSync()!;
  print('Enter the genre of the book');
  final genre = stdin.readLineSync()!;
  booksController.updateBook(
      title: title, newTitle: newTitle, author: author, genre: genre);
}

void addUser() {
  print('Enter the name of the user');
  final name = stdin.readLineSync()!;
  print('Enter the age of the user');
  final age = int.parse(stdin.readLineSync()!);
  usersController.addUser(name: name, age: age);
}

void removeUser() {
  print('Enter the name of the user');
  final name = stdin.readLineSync()!;
  usersController.removeUser(name: name);
}

void updateUser() {
  print('Enter the name of the user');
  final name = stdin.readLineSync()!;
  print('Enter the updated name of the user');
  final updatedName = stdin.readLineSync()!;
  print('Enter the age of the user');
  final age = int.parse(stdin.readLineSync()!);
  usersController.updateUser(name: name, updatedname: updatedName, age: age);
}