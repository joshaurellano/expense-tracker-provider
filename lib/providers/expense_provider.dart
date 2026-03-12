import 'package:flutter/material.dart';

class Expenseprovider extends ChangeNotifier {
  final List<Map<String, dynamic>> _expenses = [
    {
      'id': 1,
      'title': 'Gala',
      'expense_amt': 500
    },
    {
      'id': 2, 
      'title': 'Home Credit', 
      'expense_amt': 2500
    },
    {
      'id': 3, 
      'title': 'Internet', 
      'expense_amt': 2200
    }
  ];

  List<Map<String, dynamic>> get allExpenses => _expenses;

  int get totalExpense => 
    _expenses.fold(0, (sum, item) => sum + (item['expense_amt'] as int));

  void addExpense(String title, int amount) {
    _expenses.add({
      'id':DateTime.now().millisecondsSinceEpoch,
      'title':title,
      'expense_amt': amount
    });
    notifyListeners();
  }

  void editExpense(int id, String newTitle, int newAmount) {
    final index = _expenses.indexWhere((e) => e['id'] == id);
    if (index != -1) {
      _expenses[index] = {
        'id' : id,
        'title': newTitle,
        'expense_amt': newAmount
      };
      notifyListeners();
    }
  }

  void removeExpense(int id) {
    _expenses.removeWhere((e) => e['id'] == id);
    notifyListeners();
  }
}