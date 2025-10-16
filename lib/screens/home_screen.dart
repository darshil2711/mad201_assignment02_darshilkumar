/// MAD201-01 Assignment 2
/// Author: Darshilkumar Karkar (A00203357)
/// Displays list of expenses and total balance.

import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'add_expense_screen.dart';
import '../widgets/expense_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Expense> _expenses = [];

  double get total => _expenses.fold(0, (sum, e) => sum + e.amount);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker')),
      body: Column(
        children: [
          // Top card showing total expenses
          Card(
            margin: const EdgeInsets.all(12),
            color: Colors.indigo.shade50,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              title: const Text(
                'Total Expenses',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: Text(
                '\$${total.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
          ),

          // Expense list
          Expanded(
            child: _expenses.isEmpty
                ? const Center(
                    child: Text(
                      'No expenses yet.\nTap + to add one.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _expenses.length,
                    itemBuilder: (context, index) {
                      final expense = _expenses[index];
                      return ExpenseCard(expense: expense);
                    },
                  ),
          ),
        ],
      ),

      // Floating Add button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final newExpense = await Navigator.push<Expense>(
            context,
            MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
          );
          if (newExpense != null) {
            setState(() => _expenses.add(newExpense));
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Expense'),
      ),
    );
  }
}
