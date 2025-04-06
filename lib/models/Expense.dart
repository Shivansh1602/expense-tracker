import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart'; //package to generate unique id's
import 'package:intl/intl.dart'; //used to get date package

final formatter =
    DateFormat.yMd(); //used  to store year month date from intl package

const uuid = Uuid(); //uuid package import kia phir variable mein store krdia

enum Category { food, travel, leisure, work }

const categoryIcons = {
  //this is created to store icons value for each of the above enum category respectively using maps
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense({
    required this.amount, //class bnayi expense naam ki alag folder mein jo model store kregi expenses ka
    required this.date,
    required this.title,
    required this.category,
  }) : id =
           uuid.v4(); // id instantiate ki uuid se id mein , nayi id generate kregi jbhi ye class call hogi

  final String id;
  final double amount; //model ke parameters
  final DateTime date;
  final String title;
  final Category category;

  String get formattedDate {
    return formatter.format(
      date,
    ); // this getter is made to get a date in more human readable form
  }
}

class ExpenseBucket {// build to store the amount for the chart 
  ExpenseBucket({
    required this.category, 
    required this.expenses});


 ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)//adding additional constructor functions ,,,,, contructuing an extra and alternative constuctor function in this class 
 : expenses=allExpenses.where((expense)=>expense.category==category).toList() ;        
 
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses{
    double sum=0;
  for(final expense in expenses){
    sum+=expense.amount;// sum=sum+expense.amount
  }


    return sum;
  }
}
