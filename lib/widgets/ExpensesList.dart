import 'package:expense_tracker/Expenses.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widgets/ExpensesItems.dart';

class ExpensesList extends StatelessWidget {                                                       // thsi class is built for the output of the dummy data created in expenses class
  const ExpensesList({super.key, required this.expenses,required this.onRemovedExpense });

  final List<Expense>expenses;                                                                    // this variable is created to output the list properties List<Expense>

  final void Function(Expense expense) onRemovedExpense;                                        // it stores the function in the expenses class which deletes the data and we pass onRemovedExpense in the constructor fucntion as a parameter 
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index)=> Dismissible(   
        background:Container(color: Theme.of(context).colorScheme.error.withValues(alpha: 0.85),
       // margin: EdgeInsets.symmetric(horizontal:Theme.of(context).cardTheme.margin!.horizontal,vertical: Theme.of(context).cardTheme.margin!.vertical),
       margin: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
       
        ) ,                                                                          // dismissible is for swiping and deleting the widget on the main screen 
        key: ValueKey(expenses[index]), 
        onDismissed: (direction){                                                                      // onDismissed is used for actually deleting thd data it requires direction and function 
          onRemovedExpense(expenses[index]);
        },

        child: ExpensesItems(expenses[index])) ,
    );                                                                                        // we r using ListView.builder to get scrollable list and not column widget beacuse it is not optimal to use column widget when we dont know the number of the widgets or lists a user can make
  }
}
