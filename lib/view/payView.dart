

import 'package:flutter/material.dart';

import 'resultView.dart';
import 'foodsView.dart';


class Pay extends StatefulWidget {
  const Pay({Key? key}) : super(key: key);

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Ödeme Sayfasi  "),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Image.asset("icons/credit.png",width: 200,height: 200,),

          const Padding(
            padding: EdgeInsets.only(bottom: 40.0,right: 10.0,left: 10.0),
            child: TextField(
              style: TextStyle(color: Colors.blue),
              keyboardType: TextInputType.number,


              decoration: InputDecoration(

                  prefixIcon: Icon(Icons.credit_card),


                  hintText: "Kart Numarasi",
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0)))
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40.0,left: 10.0,right: 10.0),
            child: TextField(

              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(


                  hintText: "Kart Üzerindeki İsim",
                  prefixIcon: Icon(Icons.add_circle),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0)))
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 50,right: 50),
            child: Center(
              child: TextField(
                style: TextStyle(color: Colors.blue),
                decoration: InputDecoration(hintText: "Son Kullanma Tarihi  ",
                    prefixIcon: Icon(Icons.date_range),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0)))),

              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(right: 50,left: 50,top: 30),
            child: TextField(
              style: TextStyle(color: Colors.blue),
              decoration: InputDecoration(hintText: "CVC",
                  prefixIcon: Icon(Icons.security),
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15.0)))),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ElevatedButton.icon(
              icon : const Icon(Icons.lock,size: 15,),
              label: Text("Satin Al"),
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  )
              ),

              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Result()));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Siparis vermeye devam etmek istiyor musunuz ?"),
                    action: SnackBarAction(
                      label: "Evet",
                      textColor: Colors.red,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FoodsView()));


                      },
                    ),),

                );


              },
            ),
          )



        ],
      ),



    );
  }
}
