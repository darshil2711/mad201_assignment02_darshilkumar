# Personal Expense Tracker App  
**Course:** F2025 MAD201-01 – Cross Platform MA  
**Assignment:** 2  
**Author:** Darshilkumar Karkar (A00203357)  

---

## 🧩 Overview
This Flutter application is a **Personal Expense Tracker** that lets users record, view, and manage their daily expenses.  
It demonstrates:
- Stateful widget usage with `setState()`
- User input and form validation with `TextEditingController`
- Multi-screen navigation using the `Navigator` class
- Clean UI structure using reusable widgets and models
- Proper GitHub workflow (commits, branches, pull requests)

---

## 🎯 App Features
1. **Home Screen**
   - Displays all expenses in a scrollable list.
   - Shows total expense amount at the top.
   - FloatingActionButton to navigate to “Add Expense” screen.

2. **Add Expense Screen**
   - Fields: Title, Amount, Description, Date.
   - Uses validation to prevent invalid entries.
   - On Save → returns new expense to Home Screen.

3. **Expense Detail Screen**
   - Displays full details of any selected expense.
   - Back navigation using `Navigator.pop()`.

4. **Data Handling**
   - Temporary in-memory `List<Expense>` (no database).
   - Expense model defined in `models/expense.dart`.

---

## 🧱 Project Structure
expense-tracker/
├─ lib/

│ ├─ main.dart

│ ├─ models/

│ │ └─ expense.dart

│ ├─ screens/

│ │ ├─ home_screen.dart

│ │ ├─ add_expense_screen.dart

│ │ └─ expense_detail_screen.dart

│ └─ widgets/

│ └─ expense_card.dart

├─ pubspec.yaml

├─ .gitignore

└─ README.md


## 🧭 App Navigation Flow

HomeScreen
   ↓
AddExpenseScreen
   ↓
Return data → HomeScreen updates
   ↓
ExpenseDetailScreen (via tapping a list item)



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
