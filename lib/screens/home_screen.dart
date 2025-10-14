/// MAD201-01 Assignment 2
/// Author: Darshilkumar Karkar (A00203357)
/// Home screen shows list of expenses and FAB to add.

import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'add_expense_screen.dart';
import 'expense_detail_screen.dart';
import '../widgets/expense_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> _expenses = [];

  double get total =>
      _expenses.fold(0, (sum, e) => sum + e.amount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: const Text('Total'),
              trailing: Text('\$${total.toStringAsFixed(2)}'),
            ),
          ),
          Expanded(
            child: _expenses.isEmpty
                ? const Center(child: Text('No expenses yet.'))
                : ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (context, idx) {
                      final exp = _expenses[idx];
                      return ExpenseCard(
                        expense: exp,
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => ExpenseDetailScreen(expense: exp),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push<Expense?>(
            context,
            MaterialPageRoute(builder: (c) => const AddExpenseScreen()),
          );
          if (result != null) {
            setState(() {
              _expenses.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
