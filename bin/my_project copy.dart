
void main() {
  details(name:'john', age: 25);
  details(name:'paul');

}


void details({required String name, int age = 0}){

  print('Name: $name');
  print('Age: $age');

}
