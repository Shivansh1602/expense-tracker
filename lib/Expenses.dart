import 'package:expense_tracker/NewExpense.dart';
import 'package:expense_tracker/charts/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widgets/ExpensesList.dart';

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
 
];




class _ExpensesState extends State<Expenses> {
  void openAddExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Newexpense(onAddExpense: _addExpense,),
    );
  }


  void _addExpense(Expense expense ) // fucntion created to add expense 
{
setState(() {
    registered_expense.add(expense);

});

}


void _removeExpense  (Expense expense){                                               // function created to remove the data of the expense after swiping 

final expenseIndex=registered_expense.indexOf(expense); // expenseIndex variable is created to store the index of the expense 
  setState(() {
    registered_expense.remove(expense);                                  // .remove is inbuilt property provided by dart and flutter just like .add 
  });
    ScaffoldMessenger.of(context).clearSnackBars();// to clear the snackbar message as soon as other function is performed and present snackbar message in reference to the new activity 
  ScaffoldMessenger.of(context).showSnackBar( // scaffoldmessengaer is a widget used to display a message on the ui based on the activity done by user 
    SnackBar(
      content:Text('Expense Deleted'),
      duration:  Duration(seconds: 3),
     action: SnackBarAction(// here we perform the undo method if we delete an expense and we have to get it back 
      label: 'UNDO',
   onPressed:(){
    setState(() {  // we get the index of thre expense which we removed and bring it back by inserting it in registered_expense list
      registered_expense.insert(expenseIndex, expense);

    });
   }),
      )
      );
}



  @override
  Widget build(BuildContext context) {
  
  Widget mainContent=Center(child: Text('No expenses, start adding some!'),);           //creating this to show a message if there is no expense present on the main screen

  if(registered_expense.isNotEmpty){                                                            // if we add expense we override the empty screen text message and presemt the data in the registered expense 

   mainContent= ExpensesList(
            expenses: registered_expense,
            onRemovedExpense: _removeExpense,);
   
  }


    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              openAddExpense();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses:registered_expense),
          Expanded(child:mainContent,  //passing the content 
            ),
        ],
      ),
    );
  }
}
