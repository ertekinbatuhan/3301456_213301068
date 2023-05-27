import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:yemek_app/kullan%C4%B1lmayanlar/firestore.dart';


import 'main.dart';

class Adduserinfo extends StatefulWidget {










  @override
  State<Adduserinfo> createState() => _AdduserinfoState();

}

class _AdduserinfoState extends State<Adduserinfo> {
  var customerName = TextEditingController();
  var customerSurname = TextEditingController();
  var customerAddress = TextEditingController();
  var customerKey = GlobalKey<ScaffoldState>();
  FireStoreService _statusService  = FireStoreService();


  Future<void> girisKontrol() async {

    var name = customerName.text ;
    var surName = customerSurname.text;
    var address = customerAddress.text;


    

    if ( name != "" && surName != "" && address != "") {
      //await tanımlamanın bitmesini bekliyor
      var shared = await SharedPreferences.getInstance();


      shared.setString("customerName", name);
      shared.setString("surName", surName);
      shared.setString("address", address);

    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));


    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("İsim && Soyad && Adresi boş bırakmayınız"))
      );

    }

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Bilgileri") ,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Image.asset("icons/placeholder.png",height: 150, alignment: Alignment.center,),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: customerName,
              decoration: const InputDecoration(
                  hintText: "İsim",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: customerSurname,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))
                  ),
                  hintText: "Soy isim"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: customerAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),

                  ),

                  hintText: "Adres Bilgisi"
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 180,
              child: ElevatedButton(
                child: const Text("Kaydet"),
                style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))
                    )
                ),
                onPressed: () {
                  _statusService.addData(customerName.text, customerSurname.text, customerAddress.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));

                 // girisKontrol();



                },
              ),
            ),
          )

        ],

      ),
    );
  }
}
