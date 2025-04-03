import 'package:expense_tracker/Expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widgets/ExpensesItems.dart';

class ExpensesList extends StatelessWidget {                                      // thsi class is built for the output of the dummy data created in expenses class
  const ExpensesList({super.key, required this.expenses});

  final List<Expense>expenses;                                           // this variable is created to output the list properties List<Expense>

  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index)=> ExpensesItems(expenses[index]),
    );                                                                         // we r using ListView.builder to get scrollable list and not column widget beacuse it is not optimal to use column widget when we dont know the number of the widgets or lists a user can make
  }
}
