import 'package:uuid/uuid.dart';//package to generate unique id's

const  uuid=Uuid();              //uuid package import kia phir variable mein store krdia 
enum  Category{food,travel,leisure,work}

class Expense{

Expense({ 
  required this.amount,       //class bnayi expense naam ki alag folder mein jo model store kregi expenses ka 
  required this.date,
  required this.title,
  required this.category,
}) :id=uuid.v4();              // id instantiate ki uuid se id mein , nayi id generate kregi jbhi ye class call hogi 


  final String id;
  final double amount;           //model ke parameters 
  final DateTime date;
  final String title;
  final Category category;

}