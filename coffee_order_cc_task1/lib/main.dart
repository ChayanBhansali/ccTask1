import 'package:coffee_order_cc_task1/sendMail.dart';
import 'package:flutter/material.dart';

import 'package:coffee_order_cc_task1/bill.dart';

void main() {
  runApp(MaterialApp(

    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => home(),

      '/bill': (context) => bill(),
      '/sendmail': (context) => EmailSender(),
    },
  ));
}
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int cost = 0;
  int countExpressoShot = 0;
  int countWhippedCream = 0;
  int countSugarCube = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      appBar: AppBar(
        title: Text('Customise Your Coffee'),
        centerTitle: true,
        backgroundColor: Colors.orange.shade700,
      ),
     body: Column(
       children: [
         Center(
           child: Container(
             width: 250.0,
             height: 250.0,
             alignment: Alignment.center,
             decoration: new BoxDecoration(

               image: DecorationImage(
                   image: AssetImage('images/coffee_image.png'),
                   fit: BoxFit.fill
               ),
             ),
           ),
         ),
         Text('Total Cost -' + '$cost' + ' Rupees',
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.bold,
           ),
         ),
         SizedBox(height: 10,),
         Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
                Wrap(
                                children: [
                                Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                color: Colors.brown.shade900,
                                borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topRight: Radius.circular(10),
                                  bottomLeft:  Radius.circular(10),
                                topLeft: Radius.circular(10),
                                )
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                child: Column(
                                  children: [
                                    Text('ADD',

                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                    ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text('Expresso Shot',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),


                                ),
                  ]
                ),
             Wrap(
                 children: [
                   Container(
                     width: 100,
                     height: 100,
                     decoration: BoxDecoration(
                         color: Colors.brown.shade900,
                         borderRadius: BorderRadius.only(
                           bottomRight: Radius.circular(10),
                           topRight: Radius.circular(10),
                           bottomLeft:  Radius.circular(10),
                           topLeft: Radius.circular(10),
                         )
                     ),
                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                     child: Column(
                       children: [
                         Text('ADD',

                           style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 16,
                           ),
                         ),
                         SizedBox(height: 10,),
                         Text('Whipped Cream',
                           style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 14,
                           ),
                         ),

                       ],
                     ),
                   ),
                 ]
             ),
             Wrap(
                 children: [
                   Container(
                     width: 100,
                     height: 100,
                     decoration: BoxDecoration(
                         color: Colors.brown.shade900,
                         borderRadius: BorderRadius.only(
                           bottomRight: Radius.circular(10),
                           topRight: Radius.circular(10),
                           bottomLeft:  Radius.circular(10),
                           topLeft: Radius.circular(10),
                         )
                     ),
                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                     child: Column(
                       children: [
                         Text('ADD',

                           style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 16,
                           ),
                         ),
                         SizedBox(height: 10,),
                         Text('Sugar Cube',
                           style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 14,
                           ),
                         ),
                       ],
                     ),
                   ),
                 ]
             ),

           ],
         ),
         SizedBox(height: 4,),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Row(
               children: [
                 ElevatedButton(
                    onPressed: () {
                      setState(() {
                        countExpressoShot = countExpressoShot + 1 ;
                        cost = cost + 45 ;
                      });
                    },
                   child: Text('+'),
                   style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey
                   ),

                 ),
                 SizedBox(width: 2,),
                 ElevatedButton(
                   onPressed: () {
                     if(countExpressoShot > 0){
                     setState ( () {
                       countExpressoShot = countExpressoShot - 1;
                       cost = cost - 45;
                     });
                   }
                   },
                   child: Text('-'),
                   style: ElevatedButton.styleFrom(
                       primary: Colors.blueGrey
                   ),

                 ),
               ],
             ),
             SizedBox(width:1,),
             Row(
               children: [
                 ElevatedButton(
                   onPressed: () {
                     setState ( () {
                       countWhippedCream = countWhippedCream + 1;
                       cost = cost + 30;
                     });
                   },
                   child: Text('+'),
                   style: ElevatedButton.styleFrom(
                       primary: Colors.blueGrey
                   ),

                 ),
                 SizedBox(width: 2,),
                 ElevatedButton(
                   onPressed: () {
                     if(countWhippedCream > 0){
                       setState ( () {
                         countWhippedCream = countWhippedCream - 1;
                         cost = cost - 30;
                       });
                     }
                   },
                   child: Text('-'),
                   style: ElevatedButton.styleFrom(
                       primary: Colors.blueGrey
                   ),

                 ),
               ],
             ),
             SizedBox(width:1,),
             Row(
               children: [
                 ElevatedButton(
                   onPressed: () {
                     setState ( () {
                       countSugarCube = countSugarCube + 1;
                       cost = cost + 5;
                     });
                   },
                   child: Text('+'),
                   style: ElevatedButton.styleFrom(
                       primary: Colors.blueGrey
                   ),

                 ),
                 SizedBox(width: 2,),
                 ElevatedButton(
                   onPressed: () {
                     if(countSugarCube > 0){
                       setState ( () {
                         countSugarCube = countSugarCube - 1;
                         cost = cost - 5;
                       });
                     }
                   },
                   child: Text('-'),
                   style: ElevatedButton.styleFrom(
                       primary: Colors.blueGrey
                   ),

                 ),
               ],
             ),
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Text('$countExpressoShot'),
             SizedBox(width: 5,),
             Text('$countWhippedCream'),
             SizedBox(width: 5,),
             Text('$countSugarCube'),
           ],
         ),
        Padding(
          padding: const EdgeInsets.fromLTRB(250, 180, 10, 10),
          child: ElevatedButton( onPressed: (){

              Navigator.pushNamed(context, '/bill',arguments: {
                "ExpressoShot" : countExpressoShot,
                "WhippedCream" : countWhippedCream,
                "SugarCube" : countSugarCube,
                "total_cost" : cost,
              });

          },
                  child: Text('Go To Bill'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.brown.shade700
                          ),
            ),
        )
       ],
     ),

    );
  }
}

