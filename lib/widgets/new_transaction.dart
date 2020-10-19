import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  void submitData(){
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    

    widget.addTx(
      enteredTitle,
      enteredAmount
    );
    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
              onSubmitted:(_)=> submitData(),
            ),

            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged:(val){
              //   amountInput = val;
              // } ,
              controller: amountControler,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> submitData(),
            ),

            FlatButton(
              onPressed: submitData,
              child: Text('Add Transaction'),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
