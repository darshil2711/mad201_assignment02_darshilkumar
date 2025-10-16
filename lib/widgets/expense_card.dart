/// MAD201-01 Assignment 2
/// Author: Darshilkumar Karkar (A00203357)
/// Displays a single expense in a styled card widget.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMd().format(expense.date);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.shade100,
          child: const Icon(Icons.attach_money, color: Colors.indigo),
        ),
        title: Text(
          expense.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${expense.description}\n$formattedDate',
          style: const TextStyle(fontSize: 13),
        ),
        isThreeLine: true,
        trailing: Text(
          '\$${expense.amount.toStringAsFixed(2)}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
