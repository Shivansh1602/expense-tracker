import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

// dummy data create krhe hai using expense class and storing it in a variable of type list<expense>
final List<Expense> registered_expense = [
  //this variable of type List<Expense> is created to store dummy data
  Expense(
    amount: 19.99,
    title: 'flutter course',
    date: DateTime.now(),
    category: Category.work,
  ),
  Expense(
    amount: 20.4,
    title: 'Cinema',
    date: DateTime.now(),
    category: Category.leisure,
  ),
];

class _ExpensesState extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: 
    [
      const Text('chart'),
     Expanded(child: ExpensesList(expenses: registered_expense ))
     ])
     );
  }
}
