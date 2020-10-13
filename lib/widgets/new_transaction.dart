import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();
  final Function addTx;
  NewTransaction(this.addTx);
  
  // submitData it is submitted data from textfield 
  void submitData(){
    final enteredTitle = titleControler.text;
    final enteredAmount = double.parse(amountControler.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount
    );

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
