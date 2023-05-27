
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:yemek_app/json/personel.dart';

import 'package:http/http.dart' as http;



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final url = Uri.parse('https://reqres.in/api/users');
   var counter;
  var personalResult;

  Future getPerson() async {
    try {
      // istek atıyoruz
      final response = await http.get(url);
      //200 dönerse başarılı demektir
      if (response.statusCode == 200) {
        var result = personalFromJson(response.body);
       if (mounted) {
          try {
            setState(() {
              // attığımız isteğe göre index sayısını döncek ona göre listelicez

              counter = result.data!.length;
              //bağlıyoruz
              personalResult = result;
            });
          } on Exception catch (e, s) {
            print(s);
          }
        }
        return result;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getPerson();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personel Listesi'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: counter != null  ?  // counter null degilse veri gösteriyoruz
                 ListView.builder(
                itemCount: counter,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      personalResult.data[index].firstName +
                          ' ' +
                          personalResult.data[index].lastName,
                      style: TextStyle(fontSize: 20,color: Colors.deepOrange),
                    ),

                    subtitle: Text(
                      personalResult.data[index].email,
                      style: TextStyle(fontSize: 18),
                    ),
                    leading: CircleAvatar(
                      radius: 36.0,
                      backgroundImage:
                      NetworkImage(personalResult.data[index].avatar),
                    ),
                  );
                })
            //null ilse progress bar gösteriyoruz ama düzgün calısmıyor
                : Center(child: CircularProgressIndicator())),
      ),

    );
  }
}


