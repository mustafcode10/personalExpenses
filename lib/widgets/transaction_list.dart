import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personalExpenses/models/transaction.dart';




class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
              child: transactions.isEmpty ? 
               
               Column(

                 children: [
                   Text('No transaction added yet!',
                   style: Theme.of(context).textTheme.title,
                   ),
                   SizedBox(
                     height: 10,
                   ),

                   Container(
                     height: 200,
                     width: 200,
                     child: Image.asset('assets/images/mustaf1.png', fit: BoxFit.cover,)),
                 ],
               )
              :ListView.builder(itemBuilder: (ctx, index){
                return  Card(
                    child: Row(
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.purple)),
                          padding: EdgeInsets.all(15),
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              transactions[index].title,
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              DateFormat.yMMMEd().format(transactions[index].date),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                  );

              },
              itemCount: transactions.length,
              
              
              ),
      
    );
  }
}