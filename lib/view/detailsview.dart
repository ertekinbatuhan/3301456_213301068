import 'package:flutter/material.dart';


import '../model/meals.dart';
import 'paymentview.dart';




class Details extends StatefulWidget {

  Yemekler meals ;

  Details({required this.meals});


  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meals.yemek_isim,style: TextStyle(fontSize: 30.0),),


      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.meals.yemek_resim}",width: 500,),
            Text("${widget.meals.yemek_fiyat}\u{20BA}", style: TextStyle(color: Colors.orange,fontSize: 50), ),

            SizedBox(width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Siparis Ver",),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))

                    )
                ),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Result()));
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Pay()));



                },
              ),
            )


          ],
        ),
      ),
    );
  }
}
