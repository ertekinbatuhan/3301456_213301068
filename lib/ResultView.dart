
import 'dart:math';

import 'package:flutter/material.dart';


class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  late int min = 1 ;
  late  int max = 99999 ;

  var random =  Random();

  late var randomNumber = min + random.nextInt((max - min))  ;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Siparişiniz alınmıştır"),
        actions: [
          ElevatedButton(
            child: Text("Çıkış"),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);

            },
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset("images/siparisicon.jpg" , height: 500, width: 500,),
          Text("Sipariş numaranız : ${randomNumber}", style: TextStyle(
              color: Colors.red,
              fontSize: 20.0
          ),),


        ],
      )
      ,
    );
  }
}
