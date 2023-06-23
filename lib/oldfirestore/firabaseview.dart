
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'firestore.dart';




class FirebaseListPage extends StatefulWidget {
  @override
  _FirebaseListPageState createState() => _FirebaseListPageState();
}

class _FirebaseListPageState extends State<FirebaseListPage> {
  FireStoreService _fireStoreService = FireStoreService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

   // List<UsersInfo> myList = [] ;


    return Scaffold(
      appBar: AppBar(
        title: const Text("Kullanıcı Bilgileri"),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: _fireStoreService.getData(),
        builder: (context, snaphot) {
          return !snaphot.hasData
              ? const CircularProgressIndicator()
              : ListView.builder(
              itemCount: snaphot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot myData = snaphot.data!.docs[index];

               // final userInfo = UsersInfo(id: myData['id'], name: myData['name'], surName: myData['surName'], address: myData['address']);
               // myList.add(userInfo);



                Future<void> _showChoiseDialog(BuildContext context) {
                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text(
                              "Silmek istediğinize emin misiniz?",
                              textAlign: TextAlign.center,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                            content: Container(
                                height: 30,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        _fireStoreService
                                            .removeData(myData.id);
                                        Navigator.pop(context);
                                      },
                                      child: const Text(
                                        "Evet",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                     // Navigator.push(context, MaterialPageRoute(builder: (context) => batuhanTest(usersList: myList,)));
                                      },
                                      child: const Text(
                                        "Vazgeç",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )));
                      });
                }

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      _showChoiseDialog(context);
                    },
                    child: Container(
                      height: size.height * .3,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.orangeAccent, width: 2),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${myData['name']}",
                              style: const TextStyle(fontSize: 30,color: Colors.purple),
                              textAlign: TextAlign.center,
                            ),
                            Text("${myData["surName"]}",style: const TextStyle(fontSize: 25,color: Colors.red),),
                            Text("${myData["address"]}",style: const TextStyle(fontSize: 20,color: Colors.blue),)


                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}