/// MAD201-01 Assignment 2
/// Author: Darshilkumar Karkar (A00203357)
/// Shows full expense details.

import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseDetailScreen extends StatelessWidget {
  final Expense expense;
  const ExpenseDetailScreen({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final date = DateFormat.yMMMd().format(expense.date);
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Details')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title: ${expense.title}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Amount: \$${expense.amount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Date: $date', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 12),
            const Text('Description:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(expense.description),
          ],
        ),
      ),
    );
  }
}
