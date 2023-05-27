import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:yemek_app/firestore/update.dart';
import 'package:yemek_app/firestore/usermodel.dart';

import 'addInfo.dart';


class FireStoreHomePage extends StatelessWidget {
  final CollectionReference _reference =
  FirebaseFirestore.instance.collection('userInfo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Firestore CRUD'),
          centerTitle: true,
        ),
        body: FutureBuilder<QuerySnapshot>(
          future: _reference.get(),
          builder: (context, snapshot) {
           //Hata kontrol etme
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            }
           // Eğer data varsa
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data!;
              List<QueryDocumentSnapshot> documents = querySnapshot.docs;

              List<UserInfo> info = documents
                  .map((e) => UserInfo(
                  id: e['id'],
                  surName: e['surName'],
                  name: e['name'],
                  marks: e['point']
              ))
                  .toList();
              return _getBody(info);
            } else {
              // Show Loading
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
          // child: _getBody()
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            //
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddInfo(),
                ));
            //
          }),
          child: const Icon(Icons.add),
        ));
  }

  Widget _getBody(info) {
    return info.isEmpty
        ? const Center(
      child: Text(
        'Sayfa geçmişim kadar temiz ... ',
        textAlign: TextAlign.center,
      ),
    )
        : ListView.builder(
      itemCount: info.length,
      itemBuilder: (context, index) => Card(
        color: Colors.orangeAccent ,

        child: ListTile(
          title: Text(info[index].surName,style: TextStyle(color: Colors.red,fontSize: 20.0),)
          ,

          subtitle: Text(info[index].name,style: TextStyle(color: Colors.black),),

          leading: CircleAvatar(
            radius: 25,
            child: Text('${info[index].marks}'),
          ),
          trailing: SizedBox(
            width: 60,
            child: Row(
              children: [
                InkWell(
                  child: Icon(
                    Icons.add,
                    color: Colors.black.withOpacity(0.75),
                  ),
                  onTap: () {
                    //
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpdateInfo(userInfo: info[index]),
                        ));
                    //
                  },
                ),
                InkWell(
                  child: const Icon(Icons.delete),
                  onTap: () {
                    //
                    _reference.doc(info[index].id).delete();
                    // To refresh
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FireStoreHomePage(),
                        ));

                    //
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}