//created to project individual items on the screen
import 'package:expense_tracker/models/Expense.dart';
import 'package:flutter/material.dart';

class ExpensesItems extends StatelessWidget {
  const ExpensesItems(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title),
            SizedBox(height: 4),
            Row( 
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                ), // tostrignasfixed typecast krta hai int ko string mein aur as fixed sirf decimal ke baad 2 value output dega and dollar sign add krne ke lie backslash lgaya hai first dollar sign is string and second is of dart that outputs the further code value
                Spacer(),
                Row(
                  children: [
                     Icon(categoryIcons[expense.category]),// using category map as to get icons value created in ecpense class
                    SizedBox(height: 8,),
                    Text(expense.formattedDate)],//calling the getter from exoense class which formats date 
                ), // also typecasting datetime in string
              ],
            ),
          ],
        ), // column use krhe hhai and not listview because its not a long list and we can afford column while keeping optimization in mind and sirf do hi rows display krni hai
      ),
    );
  }
}
