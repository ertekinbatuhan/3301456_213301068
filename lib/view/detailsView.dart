import 'package:flutter/material.dart';

import '../Model/meals.dart';
import 'payView.dart';




class Details extends StatefulWidget {

  Meals meals ;

  Details({required this.meals});


  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemek :  ${widget.meals.meal_name}"),


      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("images/${widget.meals.meal_picture}",width: 500,),
            Text("${widget.meals.meal_price}\u{20BA}", style: TextStyle(color: Colors.purple,fontSize: 50), ),

            SizedBox(width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text("Siparis Ver",),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
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
