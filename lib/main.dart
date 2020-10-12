import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  //  String titleInput;
  //  String amountInput;
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            color: Colors.amber,
            child: Card(
              child: Text('Chart days'),
              elevation: 5,
              color: Colors.blue,
            ),
          ),
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    // onChanged: (val){
                    //   titleInput =val;
                    // },
                    controller: titleControler,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    // onChanged:(val){
                    //   amountInput = val;

                    // } ,
                    controller: amountControler,
                  ),
                  FlatButton(
                    onPressed: () {
                      // print(titleInput);
                      // print(amountInput);
                      print(titleControler.text);
                      print(amountControler.text);
                    },
                    child: Text('Add Transaction'),
                    textColor: Colors.purple,
                  )
                ],
              ),
            ),
          ),
          TransactionList()
         
          // Card(
          //   child: Text('Text TX'),
          //   color: Colors.green,
          // )
        ],
      ),
    );
  }
}
