import 'package:flutter/material.dart';
import 'package:expense_tracker/models/Expense.dart';

class Newexpense extends StatefulWidget {
  const Newexpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<Newexpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<Newexpense> {
  final _titleController = TextEditingController(); // stores data
  final _amountController = TextEditingController(); //same

  DateTime?  _selectedDate; // this variable is built to store the value of the date showDatePicker function in dart that alows the use of calender in the function _presentDatePicker function built by us
  Category _selectedCategory = Category.food; // this variable is used to store the value of category in dropdownmenu button and it is set to leisure temporarily and initially

  void _presentDatePicker() async {    // method to get date from the user , async and await are provided by dart which gets the value of date which of data type future
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      // await allows to store the value in a variable , picked date stores the value of teh date entered by user
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate; // here the value of date is stored in _selected state variable
    });
  }

  //.then((value) {   // another method of getting the date from the user

  //   },);
  // }

  void _submitExpenseData() {
    // this function is created for presenting an error message if the data is empty and user submit the expense

    final enteredAmount = double.tryParse( _amountController.text,); //try parse creates a string to double for eg. ('hello')=>null, ('11.2')=>11.2

    final amountIsInvalid =
        enteredAmount == null || enteredAmount <= 0; //boolean value

    if (_titleController.text.trim().isEmpty || amountIsInvalid || _selectedDate == null) // text,trim.is empty are in built dart functions ,
    {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text('Invalid Input'),
              content: Text(
                'Please make sure a valid title,amount, date and category was enetered.',
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: Text('Okay'),
                ),
              ],
            ),
      );
      return;
    }
    widget.onAddExpense(
      Expense(
        amount: enteredAmount,
        date: _selectedDate!,
        title: _titleController.text,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardspace=MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(height: double.infinity ,
      child: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.fromLTRB(16,48,16,keyboardspace+16),
          child: Column(
            children: [
              // Title Input
              TextField(
                controller: _titleController, // coontroller stores data
                maxLength: 50,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
        
              const SizedBox(height: 16),
        
              // Amount & Date Row
              Row(
                children: [
                  // Amount Input
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: '\$ ',
                        labelText: 'Amount',
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Space between fields
                  // Date Picker Section
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          _selectedDate == null
                              ? 'No date selected'
                              : formatter.format(_selectedDate!),
                        ), // the _selectedDate variable is used to show the date which was stored by using await and sync in pickeddate variable ,, this line of cod4 basically suggests that if the value of the date is null then show no date picked else show the formatted date which is picked by the user and the formatted fucntion is used to present the date in mor human readable form
                        IconButton(
                          onPressed: _presentDatePicker,
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        
              const SizedBox(height: 16), // Space before buttons
              // Buttons Aligned Right
              Row(
                children: [
                  DropdownButton(
                    // dropdown button storing enum values
                    value:
                        _selectedCategory, // this shows the stored selected  value of Category on the drop down button
                    items:
                        Category.values
                            .map(
                              (category) => DropdownMenuItem(
                                value: category,
                                child: Text(category.name.toUpperCase()),
                              ),
                            )
                            .toList(),
        
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                  const Spacer(),
        
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _submitExpenseData(); // this function is for displaying the user inpiut data on the home screen widgets
                    },
                    child: const Text('Save Expense'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
