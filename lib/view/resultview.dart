
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
    int min = 1 ;
    int max = 99999 ;
    
    int minMinute = 10 ;
    int maxMinute = 70 ;
    
    

  var random =  Random();

 late var randomNumber = min + random.nextInt((max - min))  ;
 late var randomMinute = min + random.nextInt(( maxMinute - minMinute)) ;
 
  Future<void> cikisYap()  async {

    var shared = await SharedPreferences.getInstance();

    shared.remove("customerName");
    shared.remove("surName");
    shared.remove("address");


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Siparisiniz Alınmıştır"),
        actions: [
         IconButton(
           icon: const Icon(Icons.exit_to_app),
            onPressed: () {
             cikisYap();
              Navigator.of(context).popUntil((route) => route.isFirst);

            },
          )
        ],
      ),
      body: Column(
        children: [
          Image.asset("icons/courier.png" , height: 500, width: 500,),
          Text("Sipariş numaranız : $randomNumber", style: const TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 22.0
          ),),

          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text("Tahmini Bekleme Süresi : $randomMinute dakika " , style:  const TextStyle(
              color: Colors.purple ,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),),
          )


        ],
      )
      ,
    );
  }
}
