import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  final String user = 'Joshua';

  void _showAddDialog(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController, 
              decoration: 
                const InputDecoration(
                  labelText: 'Title')),
            TextField(
              controller: amountController, 
              decoration: 
                const InputDecoration(
                  labelText: 'Amount'), 
                  keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              final title = titleController.text;
              final amount = int.tryParse(amountController.text) ?? 0;
              if (title.isNotEmpty && amount > 0) {
                Provider.of<Expenseprovider>(context, listen: false).addExpense(title, amount);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context, Map<String, dynamic> expense) {
    final titleController = TextEditingController(text: expense['title']);
    final amountController = TextEditingController(text: expense['expense_amt'].toString());

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Edit Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Title')),
            TextField(controller: amountController, decoration: const InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              final title = titleController.text;
              final amount = int.tryParse(amountController.text) ?? 0;
              if (title.isNotEmpty && amount > 0) {
                Provider.of<Expenseprovider>(context, listen: false).editExpense(expense['id'], title, amount);
                Navigator.pop(context);
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good day $user'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
      body: Consumer<Expenseprovider>(
        builder: (context, expensesProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  child: SizedBox(
                    height: 120,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Total Spendings',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          const SizedBox(height: 20),
                          Text('₱${expensesProvider.totalExpense}',
                            style: const TextStyle(fontSize: 24)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text('Expense List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 10),

              // Expense List
              Expanded(
                child: ListView.separated(
                  itemCount: expensesProvider.allExpenses.length,
                  separatorBuilder: (_, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final expense = expensesProvider.allExpenses[index];
                    return ListTile(
                      title: Text(expense['title']),
                      subtitle: Text('₱${expense['expense_amt']}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _showEditDialog(context, expense),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => expensesProvider.removeExpense(expense['id']),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}