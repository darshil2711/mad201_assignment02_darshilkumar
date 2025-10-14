/// MAD201-01 Assignment 2
/// Author: Darshilkumar Karkar (A00203357)
/// Screen to add a new expense.

import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _descController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose a date')),
      );
      return;
    }
    final expense = Expense(
      title: _titleController.text.trim(),
      amount: double.parse(_amountController.text.trim()),
      description: _descController.text.trim(),
      date: _selectedDate!,
    );
    Navigator.pop(context, expense);
  }

  @override
  Widget build(BuildContext context) {
    final dateText = _selectedDate == null
        ? 'No date chosen'
        : DateFormat.yMMMd().format(_selectedDate!);
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Enter title' : null,
              ),
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Enter amount';
                  final value = double.tryParse(v);
                  if (value == null || value <= 0) return 'Enter valid amount';
                  return null;
                },
              ),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description'),
                minLines: 1,
                maxLines: 3,
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Enter description' : null,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(dateText),
                  const Spacer(),
                  TextButton(
                    onPressed: _pickDate,
                    child: const Text('Choose Date'),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: _save, child: const Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
