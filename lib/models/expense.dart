/// MAD201-01 Assignment 2
/// Author: Darshilkumar Karkar (A00203357)
/// Model: Expense data container.

class Expense {
  final String title;
  final double amount;
  final String description;
  final DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.description,
    required this.date,
  });
}

