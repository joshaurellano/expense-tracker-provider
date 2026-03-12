import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final String user = 'Joshua';

  int expenseAmt = 0;

  List<Map<String, dynamic>> expenses = [
    {
      'title':'Gala', 
      'expense_amt': 100
    },
    {
      'title':'Home Credit',
      'expense_amt': 2500
    },
    {
      'title':'Internet',
      'expense_amt':2200
    }
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good day $user'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: SizedBox(
                  height: 120,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    
                      children: [
                        const Text('Total Spendings',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                          ),),
                          SizedBox(height: 20,),
                          Text('₱$expenseAmt', style: TextStyle(
                            fontSize: 24
                          ),)
                      ],
                    ),
                  ),
                ),
              ),
              
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text('Expense List', 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),),
                  
                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: ListView.separated(
                itemCount: expenses.length,
                itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(expenses[index]['title']),
                  subtitle: Text('₱${expenses[index]['expense_amt']}'),
                );
              }, separatorBuilder: (BuildContext context, int index) => const Divider(),),
            )
          ],
        ),
      ),
    );
  }
}