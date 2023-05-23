

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoo extends StatefulWidget {
  const UserInfoo({Key? key}) : super(key: key);

  @override
  State<UserInfoo> createState() => _UserInfooState();
}

class _UserInfooState extends State<UserInfoo> {

  late String getName;
  late String getAddress;
  late String getSurName;

  Future<void> oturumBilgisi() async {
    var shared= await SharedPreferences.getInstance() ;

    setState(() {

      getName = shared.getString("customerName") ?? "Kullanıcı adı boş" ;
      getAddress = shared.getString("address") ?? "Adres boş" ;
      getSurName = shared.getString("surName") ?? "Soyadı boş" ;



    });
  }

  @override
  void initState() {
    // sayfa açılır acılmaz bilgileri okumamızı sağlıyor.
    super.initState();
    oturumBilgisi() ;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Bilgileri"),

      ),
      body: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: Text("İsim : $getName",style: const TextStyle(
              color: Colors.purple,
              fontSize: 20.0
          ),)),
          Center(child: Text("Soyad : $getSurName",style: const TextStyle(
              color: Colors.purple,
              fontSize: 20.0
          ),)),
          Center(child: Text("Adres : $getAddress",style: const TextStyle(
              color: Colors.purple,
              fontSize: 20.0
          ),)),
        ],

      ),
    );

  }
}


