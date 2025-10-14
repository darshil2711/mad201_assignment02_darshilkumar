/// MAD201-01 Assignment 2
/// Author: Darshilkumar Karkar (A00203357)
/// Small reusable card for expense list.

import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;
  final VoidCallback? onTap;
  const ExpenseCard({super.key, required this.expense, this.onTap});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMd().format(expense.date);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ListTile(
        onTap: onTap,
        title: Text(expense.title),
        subtitle: Text(date),
        trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
      ),
    );
  }
}
