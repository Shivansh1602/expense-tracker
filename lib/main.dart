import 'package:expense_tracker/Expenses.dart';
import 'package:flutter/material.dart';

 

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Expenses(),
    ),
  );
}