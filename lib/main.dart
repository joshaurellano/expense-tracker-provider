import 'package:flutter/material.dart';
import './screens/homescreen.dart';
import 'package:provider/provider.dart';
import './providers/expense_provider.dart';

void main() {
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Expenseprovider())
    ],
    child: const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      home: Homescreen(),
    );
  }
}