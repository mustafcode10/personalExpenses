import 'package:flutter/material.dart';
import './widgets/chart.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/created_mustaf.dart';
import './widgets/transaction_list.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme:ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.greenAccent,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpensSans',
            fontSize: 18
          )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        ),

        ),
        
      
      ),
      
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  //  String titleInput;
  //  String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final List<Transaction> _userTransactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 69.99,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly Groceries',
    //   amount: 16.53,
    //   date: DateTime.now(),
    // ),
  ]; 
  List<Transaction>get _recentTransaction {
    return _userTransactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))
      );
      }).toList();

  }


  void _addNewTransaction(String txTitle, double txAmount){
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
       amount: txAmount, 
       date: DateTime.now());

       setState(() {
         _userTransactions.add(newTx);
         
       });

  }
  void _startAddNewTransaction (BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return NewTransaction(_addNewTransaction);
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses', style: TextStyle(
          fontFamily: 'OpenSans'
        ),),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () =>_startAddNewTransaction(context)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            // Container(
            //   width: double.infinity,
            //   color: Colors.amber,
            //   child: Card(
            //     child: Text('Chart days'),
            //     elevation: 5,
            //     color: Colors.blue,
            //   ),
            // ),

         
            Chart(_recentTransaction),
           TransactionList(_userTransactions),
            Created()
           

           
          ],
        ),
        

      ),
     
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed:()=> _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
