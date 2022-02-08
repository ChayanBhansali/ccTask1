import 'package:flutter/material.dart';
import 'dart:async';
class bill extends StatefulWidget {
  const bill({Key? key}) : super(key: key);

  @override
  _billState createState() => _billState();
}

class _billState extends State<bill> {
  int CountCoffee = 1 ;
  TextEditingController searchcontroller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
Map info = (ModalRoute.of(context)?.settings.arguments??{}) as Map;
var totalPurchase = info['total_cost'] ;
var originalCost =  info['total_cost'] ;
totalTax instance = totalTax(n: CountCoffee, info: info);
    return Scaffold(
      appBar: AppBar(
        title: Text('Order summary'),

      ),
      body: Column(
        children: [
            SizedBox(height: 20,),


              Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children: [

              Text("Purchase Cost - " + '${instance.getCost()}' + ' rupees',
              style: TextStyle(
                fontSize: 20
              ),
              ),
              Text('Number of Expresso Shot - ' + "${info['ExpressoShot']}",
                style: TextStyle(
                    fontSize: 20
                ),),
              Text('Number of Whipped Cream Shot - ' + info['WhippedCream'].toString(),
                style: TextStyle(
                  fontSize: 20
              ),
              ),
              Text('Number of Sugar Cube - ' + info['SugarCube'].toString(),
                style: TextStyle(
                  fontSize: 20
              ),),
                  Text('Total Tax - ' + '${(instance.getCost())*0.15}',
                    style: TextStyle(
                      fontSize: 20
                  ), ),
                  Text('Total Cost - ' + '${instance.getCost() + (instance.getCost())*0.15}',
                    style: TextStyle(
                      fontSize: 20
                  ),)
                  ]
              ),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 0, 5, 0),
                        child: FlatButton(onPressed: (){


                          setState(() {
                            CountCoffee = CountCoffee + 1;
                            totalPurchase = totalPurchase +  originalCost ;
                          });
                        },
                            child: Text('+'),
                            minWidth: 10.0,
                            height: 10.0 ,
                            color: Colors.blue

                        ),
                      ),
                      Text('$CountCoffee'),
                      FlatButton(onPressed: (){
                        if(CountCoffee > 1) {
                          setState(() {
                            CountCoffee = CountCoffee - 1;
                            totalPurchase = totalPurchase - originalCost;
                          });
                        }
                        },


                          child: Text('-'),
                          minWidth: 10.0,
                          height: 10.0 ,
                          color: Colors.blue

                      ),
                    ],
                  ),

          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sendmail',arguments: {
                  "ExpressoShot" : info['ExpressoShot'],
                  "WhippedCream" : info['WhippedCream'],
                  "SugarCube" : info['SugarCube'],
                  "total_cost" : instance.getCost() + (instance.getCost())*0.15,
                  "numberOfCoffee" : CountCoffee,
                });
              },
              child: Text('Send Email')
          )
        ],
      ),
    );
  }
}

//n is number of coffee
class totalTax {
  int x = 1;
  int n;
  int cost = 0;
  int tax = 0;
  Map info ;
  totalTax({required this.n,
  required this.info
  }) {
    n = this.n;
    info = this.info;
  }

  getCost() {
    while (n >= x) {
            cost = (cost + info['total_cost'] ) as int;
            x = x + 1;
    }
    return cost;
  }
    getTax() {
      while (n >= x) {
        tax = (tax + (info['total_cost'])*0.15 ) as int;
        x = x + 1;
      }
      return tax;
    }
}