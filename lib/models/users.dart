class User{

  String name;
  int age;
  String createdAt;

  User(
    {
      required this.name, 
      required this.age
    }
    ) : createdAt = DateTime.now().toString();

    @override
    String toString() {
      return 'Name: $name\nAge: $age\nCreated At: $createdAt';
    }
}